package cn.oocl.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import cn.oocl.model.Account;

public interface AccountDao extends CrudRepository<Account, String>{

	@Query ("SELECT a from Account a where a.user_name=:username and a.password=:pw")
	Account login(@Param("username")String userName, @Param("pw") String pw);

}