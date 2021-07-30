package com.colo.orm;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DBBuilder {
	private static Logger logger = LoggerFactory.getLogger(DBBuilder.class);
	private static SqlSessionFactory factory;
	
	static {
		//mybatisconfig를 읽어들여야한다
		//Resources는 실제 파일을 읽어들이는 기능을 한다
		try {
			factory = new SqlSessionFactoryBuilder()
					.build(Resources
							.getResourceAsReader("com/colo/orm/MybatisConfig.xml"));
		} catch (IOException e) {
			logger.error("ERROR> 마이바티스 설정 파일 오류");
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
