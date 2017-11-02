package cn.oocl.utils;

import java.util.UUID;

import javax.servlet.http.Part;

import org.springframework.stereotype.Component;

@Component("fileUpload")
public class FileUploadUtils {
	public static String getSubmittedFileName(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE
																													// fix.
			}
		}
		return null;
	}
	
	
	public String randomFileName (String fileName){
		String ext = fileName.substring(fileName.lastIndexOf('.'));
		
		return UUID.randomUUID().toString() + ext;
	}
}
