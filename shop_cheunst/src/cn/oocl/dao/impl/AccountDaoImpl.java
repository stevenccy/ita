package cn.oocl.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import cn.oocl.model.Account;

@Repository ("accountDao")
public class AccountDaoImpl implements AccountDao{
	
	@PersistenceContext // 先 EntityManagerFactory,然後在從工廠中獲取 EntityManager
	private EntityManager em ;

	/* (non-Javadoc)
	 * @see cn.oocl.dao.impl.AccountDao#login(cn.oocl.model.Account)
	 */
	@Override
	public Account login(Account user) {
		
		return  em.createQuery("from account a where user_name= :user_name and password=:password and role=:password", Account.class)
				.setParameter("user_name", user.getUser_name())
				.setParameter("password", user.getPassword())
				.setParameter("role", user.getRole())
				.getSingleResult();
	}
}
