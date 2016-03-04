package org.cnfbuddy;

import java.io.StringReader;

import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.MalformedJsonException;

public class CFNTemplateValidator {

	public void validate(String templateString) throws MalformedJsonException {
		JsonParser jsonParser = new JsonParser();
		JsonReader jsonReader = new JsonReader(new StringReader(templateString)); 
		jsonParser.parse(jsonReader);
	}
}
