package cn.oocl.utils;

import java.util.HashMap;

//Container class for search results encapsulates relevant headers and JSON data
public class SearchResults {
	public HashMap<String, String> relevantHeaders;
	public String jsonResponse;

	SearchResults(HashMap<String, String> headers, String json) {
		relevantHeaders = headers;
		jsonResponse = json;
	}
}