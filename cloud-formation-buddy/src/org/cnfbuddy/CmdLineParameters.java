package org.cnfbuddy;

import java.util.List;

import org.kohsuke.args4j.Option;

public class CmdLineParameters {
	@Option(name = "-t", required = true, metaVar = "[template-project-directory]", usage = "Sets the path of CloudFormation templates")
	List<String> templateDirectories;

	@Option(name = "-o", required = true, metaVar = "[output-file-path]", usage = "Sets the path of the CloudFormation output template")
	String templateOutputPath;

	@Option(name = "-v", required = false, metaVar = "[variables-file-path]", usage = "Sets the path of the variables files containins name=value pairs that can be referenced inside templates")
	String variablesFilePath;

	public List<String> getTemplateDirectories() {
		return templateDirectories;
	}

	public String getTemplateOutputPath() {
		return templateOutputPath != null ? templateOutputPath : ".";
	}

	public String getVariablesFilePath() {
		return variablesFilePath;
	}

}
