package org.cfnbuddy;

import java.io.IOException;
import java.util.Optional;

import org.kohsuke.args4j.CmdLineException;
import org.kohsuke.args4j.CmdLineParser;

import freemarker.template.TemplateException;

public class CFNBuddyApp {
	
	public static void main(String[] args) throws IOException, TemplateException {

		Optional<CmdLineParameters> parameters = parseCmdLineParameters(args);
		if (parameters.isPresent()) {
			CFNTemplateBuilder builder = CFNTemplateBuilder
					.newInstance(parameters.get().getTemplateDirectories())
					.withOutputPath(parameters.get().getTemplateOutputPath());
			if (parameters.get().getConfigFilesPath() != null) {
				builder.withConfigFilesPath(parameters.get().getConfigFilesPath());
			}
			builder.build();
			System.out.println("Done! Success.");
		}
	}

	private static Optional<CmdLineParameters> parseCmdLineParameters(String args[]) {
		CmdLineParameters parameters = new CmdLineParameters();
		CmdLineParser cmdLineParser = new CmdLineParser(parameters);
		try {
			cmdLineParser.parseArgument(args);
			return Optional.of(parameters);
		} catch (CmdLineException e) {
			System.out.println("Options: ");
			cmdLineParser.printUsage(System.out);
		}
		return Optional.empty();
	}

}
