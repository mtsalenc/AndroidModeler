package util;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.eclipse.xtext.util.StringInputStream;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

public class XMLFormatter {
	public static String format(String input) {
		TransformerFactory factory = TransformerFactory.newInstance();
		try {
			Transformer transformer = factory.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.setOutputProperty(
					"{http://xml.apache.org/xslt}indent-amount", "4");
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(new StringInputStream(input));
			DOMSource source = new DOMSource(doc);
			Writer out = new StringWriter();
			Result result = new StreamResult(out);
			transformer.transform(source, result);
			return out.toString();
		} catch (IllegalArgumentException
				| TransformerFactoryConfigurationError | TransformerException
				| ParserConfigurationException | SAXException | IOException e) {

			e.printStackTrace();
		}

		return input;
	}
}
