package cn.oocl.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class RedisTest {

	private static JedisPool pool = null;
	
	static{
		JedisPoolConfig config = new JedisPoolConfig();	
		config.setMaxTotal(20);
		config.setMaxIdle(5);
		config.setMaxWaitMillis(1000*5);
		pool= new JedisPool(config,"10.222.58.178",6379);
	}
	
	public static Jedis getRedis(){
		if (pool !=null){
			return pool.getResource();
		}else{
			return null;
		}
	}
	
	public static void closeJedis(Jedis jedis){
		if (jedis!=null && jedis.isConnected()){
			pool.returnResource(jedis);
		}
	}
	public static void main(String[] args) {
		for (int i = 1 ; i<=30; i++){
			Jedis redis = RedisTest.getRedis();
			System.out.println("i: " + i + "-->" +redis);
			RedisTest.closeJedis(redis);
		}
	}
}
