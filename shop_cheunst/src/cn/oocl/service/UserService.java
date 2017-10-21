package cn.oocl.service;

import cn.oocl.dao.UserDaoImpl;
import cn.oocl.model.User;

public class UserService {
	private UserDaoImpl userDao = new UserDaoImpl();

	public User login(User user, String role) {
		// 此處以後會添加業務邏輯操作
		if (userDao.login(user,role)!=0){
			return user;
		}else{
			return null;
		}
	}
	
	public User login1 (User user){
//		if (account.getName().)
		return user;
	}
}
