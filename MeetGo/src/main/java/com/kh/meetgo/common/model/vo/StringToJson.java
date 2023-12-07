package com.kh.meetgo.common.model.vo;

import java.io.BufferedReader;
import java.io.IOException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class StringToJson {
		
	public static String stringToJson(String code, String key) throws ParseException {
			String result = new String();
			JSONParser jsonParse = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParse.parse(code); //code는 json형식을 가지고 있는 string타입
			result = (String)jsonObj.get(key);
			return result;
	}
	
	public static String[] stringToJson(String code, String key1, String key2) throws ParseException {
		String result[] = new String[2];
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParse.parse(code); //code는 json형식을 가지고 있는 string타입
		result[0] = (String)jsonObj.get(key1);
		result[1] = (String)jsonObj.get(key2);
		return result;
	}
	
	public static String[] stringToJson(BufferedReader br, String key1, String key2) throws ParseException, IOException {
		String line = null;
	    String message = new String();
	    final StringBuffer buffer = new StringBuffer(2048);
	    while ((line = br.readLine()) != null) {
	        message += line;
	    }
	    // System.out.println(message);
	    
		return stringToJson(message, key1, key2);
	}
}
