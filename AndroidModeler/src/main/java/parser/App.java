package parser;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import model.AndroidApplication;
import model.Component;
import model.Model;

import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import templates.ComponentTemplate;
import templates.FactoryTemplate;
import templates.GradleTemplate;
import templates.ManifestTemplate;
import templates.PackageTemplate;
import templates.impl.FactoryImplTemplate;
import templates.impl.PackageImplTemplate;
import util.XMLFormatter;

public class App {
	public static void err(String errMsg) {
		System.err.println(errMsg);
		System.exit(-1);
	}

	public static void main(String[] args) {
		if (args.length != 1)
			err("Usage: java App <input-file>");
		File file = new File(args[0]);

		if (!file.exists())
			err("Specific input file does not exists.");

		CharStream charStream = null;
		try {
			charStream = new ANTLRFileStream(args[0]);
		} catch (IOException e) {
			e.printStackTrace();
		}

		DroidModelerLexer lexer = new DroidModelerLexer(charStream);
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		DroidModelerParser parser = new DroidModelerParser(tokens);

		ParserRuleContext tree = parser.appDefinition();
		ParseTreeWalker walker = new ParseTreeWalker();
		TreeParser listener = new TreeParser();
		walker.walk(listener, tree);
		Model model = listener.getModel();

		AndroidApplication app = null;
		Path interfaceDir = null;
		Path implDir = null;				
		
	
		try {
			Path basePath = Paths.get("generated-client");
			Files.createDirectories(basePath);
			app = model.getAndroidApps().get(0);

			Path gradleFile = basePath.resolve("build.gradle");
			writeToFile(gradleFile, GradleTemplate.getInstance().generate(app));

			Path mainSourceDir = basePath.resolve("src");			
			Files.createDirectories(mainSourceDir);
			Path manifestFile = basePath.resolve("AndroidManifest.xml");
			String manifestXml = ManifestTemplate.getInstance().generate(app);
			writeToFile(manifestFile, XMLFormatter.format(manifestXml));

			interfaceDir = mainSourceDir.resolve(app.getJavaName());
			implDir = mainSourceDir.resolve(app.getJavaName()+".impl");
			Files.createDirectories(interfaceDir);
			Files.createDirectories(implDir);
		} catch (IOException e1) {
			e1.printStackTrace();
		}	   	
		
		
		for (Component c : app.getComponents()) {		
			ComponentTemplate baseTemplate = c.getBaseTemplate();
			ComponentTemplate baseimplTemplate = c.getBaseImplTemplate();
			if (baseTemplate != null) {
				//interface base class
				String code = baseTemplate.generate(app, c);
				Path interfaceFile = interfaceDir.resolve(c.getName() + "Base.java");
				writeToFile(interfaceFile, code);			
				
				//implementation base class
				String baseimplcode = baseimplTemplate.generate(app, c);
				interfaceFile = implDir.resolve(c.getName() + "BaseImpl.java");
				writeToFile(interfaceFile, baseimplcode);	
			}
			
			//interface classes
			ComponentTemplate template = c.getTemplate();
			String interfaceCode = template.generate(app, c);
			Path classFile = interfaceDir.resolve(c.getName() + ".java");			
			writeToFile(classFile, interfaceCode);			
			
			//implementation class
			ComponentTemplate implTemplate = c.getImplTemplate();
			String implcode = implTemplate.generate(app, c);
			classFile = implDir.resolve(c.getName() + "Impl.java");
			writeToFile(classFile, implcode);			
		}
		
		//factory interface		
		String factoryInterfaceCode = new FactoryTemplate().generate(app, app.getComponents());
		Path classFile = interfaceDir.resolve(app.getName()+"Factory.java");
		writeToFile(classFile, factoryInterfaceCode);
		
		//package interface	
		String packageInterfaceCode = new PackageTemplate().generate(app, app.getComponents());
		classFile = interfaceDir.resolve(app.getName()+"Package.java");
		writeToFile(classFile, packageInterfaceCode);
		
		//factory implementation
        String factoryImplCode = new FactoryImplTemplate().generate(app, app.getComponents());
        classFile = implDir.resolve(app.getName()+"FactoryImpl.java");
        writeToFile(classFile, factoryImplCode);
        
        //package implementation
        String packageImplCode = new PackageImplTemplate().generate(app, app.getComponents());
        classFile = implDir.resolve(app.getName()+"PackageImpl.java");
        writeToFile(classFile, packageImplCode);
	}
	
	

	public static void writeToFile(Path path, String content) {
		try (FileOutputStream ostream = new FileOutputStream(path.toFile());) {
			ostream.write(content.getBytes());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
