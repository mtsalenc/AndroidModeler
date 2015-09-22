package parser;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.acl.LastOwnerException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;

import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import model.AndroidApplication;
import model.Component;
import model.Model;
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

	public static void main(String[] args) throws ClassNotFoundException, IOException {
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

			List<String> packageDirStructure = new ArrayList<String>();
			String packageDir = mainSourceDir.resolve(app.getJavaName()).toString();

			int numberOfDots = countOccurrences(packageDir, ".".charAt(0));
			for (int i = 0; i <= numberOfDots; i++) {
				if (packageDir.indexOf(".") != -1) {
					packageDirStructure.add(packageDir.substring(packageDir.lastIndexOf(".")).replace(".", ""));
					packageDir = packageDir.substring(0, packageDir.indexOf("."));
				} else {
					if (packageDir.indexOf(File.separator) != -1) {
						packageDirStructure.add(packageDir.substring(packageDir.lastIndexOf(File.separator))
								.replace(File.separator, ""));
					} else {
						packageDirStructure.add(packageDir);
					}
				}
			}
			Collections.reverse(packageDirStructure);

			File curDir = mainSourceDir.toFile();
			for (String str : packageDirStructure) {
				curDir = new File(curDir.getPath() + File.separator + str);
				Files.createDirectories(curDir.toPath());
			}			
			
			interfaceDir = curDir.toPath();
			implDir = Paths.get(interfaceDir.toString() + File.separator + "impl");
			Path utilDir =  Paths.get(interfaceDir.toString() + File.separator + "util");
			Files.createDirectories(interfaceDir);
			Files.createDirectories(implDir);
			Files.createDirectories(utilDir);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		for (Component c : app.getComponents()) {
			ComponentTemplate baseTemplate = c.getBaseTemplate();
			ComponentTemplate baseimplTemplate = c.getBaseImplTemplate();
			if (baseTemplate != null) {
				// interface base class
				String code = baseTemplate.generate(app, c);
				Path interfaceFile = interfaceDir.resolve(c.getName() + "Base.java");
				writeToFile(interfaceFile, code);

				// implementation base class
				String baseimplcode = baseimplTemplate.generate(app, c);
				interfaceFile = implDir.resolve(c.getName() + "BaseImpl.java");
				writeToFile(interfaceFile, baseimplcode);
			}

			// interface classes
			ComponentTemplate template = c.getTemplate();
			String interfaceCode = template.generate(app, c);
			Path classFile = interfaceDir.resolve(c.getName() + ".java");
			writeToFile(classFile, interfaceCode);

			// implementation class
			ComponentTemplate implTemplate = c.getImplTemplate();
			String implcode = implTemplate.generate(app, c);
			classFile = implDir.resolve(c.getName() + "Impl.java");
			writeToFile(classFile, implcode);
		}

		// getting list of interfaces
		File folder = new File(interfaceDir.toUri());
		FilenameFilter fNameFilter = new FilenameFilter() {

			@Override
			public boolean accept(File dir, String name) {
				return name.endsWith(".java");
			}
		};
		File[] listOfFiles = folder.listFiles(fNameFilter);
		List<Class<?>> classList = new ArrayList<Class<?>>();

		for (File f : listOfFiles) {
			classList.add(getClassFromUrl(f));
		}
		// factory interface
		String factoryInterfaceCode = new FactoryTemplate().generate(app, app.getComponents());
		Path classFile = interfaceDir.resolve(app.getName() + "Factory.java");
		writeToFile(classFile, factoryInterfaceCode);

		// package interface
		String packageInterfaceCode = new PackageTemplate().generate(app, app.getComponents());
		classFile = interfaceDir.resolve(app.getName() + "Package.java");
		writeToFile(classFile, packageInterfaceCode);

		// factory implementation
		String factoryImplCode = new FactoryImplTemplate().generate(app, app.getComponents());
		classFile = implDir.resolve(app.getName() + "FactoryImpl.java");
		writeToFile(classFile, factoryImplCode);

		// package implementation
		String packageImplCode = new PackageImplTemplate().generate(app, app.getComponents(), classList);
		classFile = implDir.resolve(app.getName() + "PackageImpl.java");
		writeToFile(classFile, packageImplCode);

		// cleanup
		FilenameFilter cleanFilter = new FilenameFilter() {

			@Override
			public boolean accept(File dir, String name) {
				return name.endsWith(".class");
			}
		};
		File[] cleanList = folder.listFiles(cleanFilter);
		for (File f : cleanList) {
			Files.deleteIfExists(f.toPath());
		}
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

	private static Class<?> getClassFromUrl(File file)
			throws ClassNotFoundException, MalformedURLException {

		String srcUrl = file.getAbsoluteFile().toString();
		srcUrl = srcUrl.substring(0,srcUrl.lastIndexOf(File.separator+"src")) + File.separator + "src"+File.separator;
		File root = new File(srcUrl);
		
		String thePath = Paths.get(file.toString()).toString();
		String theName =thePath.substring(thePath.lastIndexOf("src")+4).replace(File.separator, ".");
		theName = theName.substring(0,theName.lastIndexOf("."));				
		
		File sourceFile = new File(root,theName.replace(".",File.separator)+".java");

		JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
		compiler.run(null, null, null, sourceFile.getPath());

		URLClassLoader classLoader = URLClassLoader.newInstance(new URL[] { root.toURI().toURL() });
		
		
		Class<?> cls = Class.forName(theName, true, classLoader);
		return cls;
	}

	public static int countOccurrences(String haystack, char needle) {
		int count = 0;
		for (int i = 0; i < haystack.length(); i++) {
			if (haystack.charAt(i) == needle) {
				count++;
			}
		}
		return count;
	}
}
