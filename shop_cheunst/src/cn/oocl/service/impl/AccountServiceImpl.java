package cn.oocl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.oocl.dao.AccountDao;
import cn.oocl.model.Account;

@Service("accountService") // 需要在xml中支持註解掃描機制
public class AccountServiceImpl {
	
	@Resource
	private AccountDao accountDao;

	public Account login(Account user) {
		// 此處以後會添加業務邏輯操作
		
		if (accountDao.login(user.getUser_name(),user.getPassword())!=null){
			return user;
		}else{
			return null;
		}
	}
}
