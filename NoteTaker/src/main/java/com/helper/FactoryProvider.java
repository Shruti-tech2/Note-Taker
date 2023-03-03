package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	public static SessionFactory factory;    //SessionFactory is connection type which contain many methods to create session.
	
	//method which will create object of class of implementation of this session factory and return session factory
	
	//we don't want to create any object to call getFactory() that's why this method is static & so to use factory variable in 
	//this static method we need to make it also static.
	public static SessionFactory getFactory()
	{
		if(factory==null)
			factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		return factory;
	}
	
	//to close factory
	public void closeFactory()
	{
		if(factory.isOpen())
			factory.close();
	}
}
