package cn.oocl.service;

import cn.oocl.dao.UserDaoImpl;
import cn.oocl.model.User;

public class UserService {
	private UserDaoImpl userDao = new UserDaoImpl();

	public int login(User user, String role) {
		// 此處以後會添加業務邏輯操作
		return userDao.login(user,role);
	}
	
	public User login1 (User user){
//		if (account.getName().)
		return user;
	}
}
