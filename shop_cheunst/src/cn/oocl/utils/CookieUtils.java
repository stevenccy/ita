package cn.oocl.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtils {

	public static Cookie getCookie(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		if (name != null) {
			for (Cookie c : cookies) {
				if (name.equals(c.getName())) {
					return c;
				}
			}
		}
		return null;
	}
}
