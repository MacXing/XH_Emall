package com.xh.test.base;

import org.junit.After;
import org.junit.Before;
import org.springframework.beans.BeansException;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UnitTestBase {

	private ClassPathXmlApplicationContext context;

	private String springXmlpath;

	public UnitTestBase() {
	}

	public UnitTestBase(String springXmlpath) {
		this.springXmlpath = springXmlpath;
	}

	@Before
	public void before() {
		if (springXmlpath == null || springXmlpath.length() == 0) {
			springXmlpath = "classpath*:applicationContext*.xml";
			try {
				context = new ClassPathXmlApplicationContext(springXmlpath);
				context.start();
			} catch (BeansException e) {
				e.printStackTrace();
			}
		}
	}

	@After
	public void after() {
		context.destroy();
	}

	@SuppressWarnings("unchecked")
	protected <T extends Object> T getBean(String beanId) {
		try {
			return (T) context.getBean(beanId);
		} catch (BeansException e) {
			e.printStackTrace();
			return null;
		}
	}

	protected <T extends Object> T getBean(Class<T> clazz) {
		try {
			return context.getBean(clazz);
		} catch (BeansException e) {
			e.printStackTrace();
			return null;
		}
	}
}
