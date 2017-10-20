package cn.oocl.dao;

import cn.oocl.model.Product;
import cn.oocl.model.User;

public class UserDaoImpl extends BaseDaoImpl<User>{

	public int login(User user, String role) {
		
		String sql = "select count(*) from user_cheunst where user_name= ? and password=? and role=?";

		return super.getCount(sql,new Object []{user.getUser_name(),user.getPassword(),user.getRole()});
	}

}
