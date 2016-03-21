package org.cfnbuddy;

import java.util.List;

import org.kohsuke.args4j.Option;

public class CmdLineParameters {
	@Option(name = "-t", required = true, metaVar = "[template-project-directory]", usage = "Sets the path of CloudFormation templates")
	List<String> templateDirectories;

	@Option(name = "-o", required = true, metaVar = "[output-file-path]", usage = "Sets the path of the CloudFormation output template")
	String templateOutputPath;

	@Option(name = "-c", required = false, metaVar = "[config-file-path]", usage = "Sets the path of the configuration files containing name=value pairs that can be referenced within templates like this: ${name}")
	List<String> configFilesPath;

	public List<String> getTemplateDirectories() {
		return templateDirectories;
	}

	public String getTemplateOutputPath() {
		return templateOutputPath != null ? templateOutputPath : ".";
	}

	public List<String> getConfigFilesPath() {
		return configFilesPath;
	}

}
