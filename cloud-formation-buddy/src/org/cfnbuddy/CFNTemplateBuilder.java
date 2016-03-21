package org.cfnbuddy;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.google.gson.JsonSyntaxException;

import freemarker.cache.FileTemplateLoader;
import freemarker.cache.MultiTemplateLoader;
import freemarker.cache.TemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class CFNTemplateBuilder {

	private final String mainTemplateFile = "main.template";
	private String outputPath = "cfn-generated.template";
	private List<String> templateDirectories;
	private List<String> configFilesPath = new ArrayList<>();
	private CFNTemplateValidator templateValidator = new CFNTemplateValidator();

	private CFNTemplateBuilder(List<String> templateDirectories) {
		this.templateDirectories = templateDirectories;
	}

	public static CFNTemplateBuilder newInstance(List<String> templateDirectories) {
		return new CFNTemplateBuilder(templateDirectories);
	}

	public CFNTemplateBuilder withOutputPath(String outputPath) {
		this.outputPath = outputPath;
		return this;
	}

	public CFNTemplateBuilder withConfigFilesPath(List<String> templateConfigFilesPath) {
		this.configFilesPath.addAll(templateConfigFilesPath);
		return this;
	}

	private Configuration createConfiguration() throws IOException {
		Configuration cfg = new Configuration(Configuration.VERSION_2_3_23);
		List<TemplateLoader> loaders = new ArrayList<>();
		for (String templateDirectory : templateDirectories) {
			loaders.add(new FileTemplateLoader(new File(templateDirectory)));
		}
		loaders.add(new FileTemplateLoader(new File(".")));
		MultiTemplateLoader templateLoader = new MultiTemplateLoader(loaders.toArray(new TemplateLoader[0]));
		cfg.setTemplateLoader(templateLoader);
		return cfg;
	}

	public void build() throws RuntimeException {
		Configuration cfg;
		try {
			cfg = createConfiguration();
			Template template = cfg.getTemplate(mainTemplateFile);
			Map<String, String> data = populateDataModel();
			Writer writer = new StringWriter();
			template.process(data, writer);
			String templateData = writer.toString();
			templateValidator.validate(templateData);
			try (Writer fileWriter = new FileWriter(new File(outputPath))) {
				fileWriter.write(templateData);
			}
		} catch (JsonSyntaxException e) {
			throw new RuntimeException(
					"Oops, looks like your template is not a valid JSON! Please have a careful look at your templates.",
					e);
		} catch (IOException | TemplateException e) {
			throw new RuntimeException(e);
		}
	}

	private Map<String, String> populateDataModel() throws IOException {
		Map<String, String> data = new HashMap<>();
		for (String configFile : configFilesPath) {
			Properties properties = new Properties();
			Reader reader = new FileReader(configFile);
			properties.load(reader);
			for (String propName : properties.stringPropertyNames()) {
				data.put(propName, properties.getProperty(propName));
			}
		}
		return data;
	}

}
