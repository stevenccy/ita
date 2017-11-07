package cn.oocl.utils;

import java.io.Serializable;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

@Component
public class RedisService {
	
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-bean.xml");
		RedisService redisService = context.getBean("redisService",RedisService.class);
		redisService.setStr("mystr","admin");
		System.out.println(redisService.getStr("mystr"));
		
		
	}
	@Resource
	private RedisTemplate<Serializable, Serializable> redisTemplate = null;

	public void setStr(String key, Serializable value) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		opsForValue.set(key, value);
	}

	public Serializable getStr(String key) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		return opsForValue.get(key);

	}

	public void hput(String key, String hashKey, Object value) {
		HashOperations<Serializable, Serializable, Object> opsForHash = redisTemplate.opsForHash();
		opsForHash.put(key, hashKey, value);
	}

	public Object hget(String key, String hashKey) {
		HashOperations<Serializable, Serializable, Object> opsForHash = redisTemplate.opsForHash();
		return opsForHash.get(key, hashKey);
	}

	public void lset(String key, Long index, Serializable value) {
		ListOperations<Serializable, Serializable> opsForList = redisTemplate.opsForList();
		opsForList.set(key, index, value);
	}

	public Object lget(String key, String hashKey, Object value) {
		ListOperations<Serializable, Serializable> opsForList = redisTemplate.opsForList();
		return opsForList.getOperations();
	}
	/*
	 * 
	 * List Set ZSet
	 */

}