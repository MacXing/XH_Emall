package com.other.log4j;

import java.sql.Connection; 
import java.sql.SQLException; 

import javax.sql.DataSource; 

import org.apache.log4j.jdbc.JDBCAppender;

public class MyAppender extends JDBCAppender{
	

	private DataSource dataSource;
	
	public DataSource getDataSource() { 
		return dataSource; 
	} 
	public void setDataSource(DataSource dataSource) { 
		this.dataSource = dataSource; 
	} 
	
	public MyAppender(){ 
		super(); 
	} 
	
	@Override 
	protected Connection getConnection(){
		
		try { 
			
			this.connection=dataSource.getConnection();
			
			} catch (SQLException e) {
			
				e.printStackTrace();
			
			} 
		return super.connection; 
	}		 
}
