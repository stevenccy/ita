package cn.oocl.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

// Read properties
public class PropUtils {

	// Load properties once ONLY
	public static Properties prop = new Properties();

	static {
		// get it from ../src directory
		try {
			InputStream in = PropUtils.class.getResourceAsStream("/shop.properties");
			prop.load(in);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static String getValue (String key){
		return prop.getProperty(key);
	}
	
	
//	public static void main(String args[]) {
//		System.out.print(PropUtils.getValue("pageSize"));
//	}

}
