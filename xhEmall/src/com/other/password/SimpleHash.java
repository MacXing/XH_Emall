package com.other.password;

import org.apache.shiro.crypto.hash.Md5Hash;


public class SimpleHash {
	public static void main(String []args){
		
		String source ="password";
		String salt= "cj";
		int hashIterations =2;
		
		Md5Hash hash = new Md5Hash(source, salt, hashIterations);
		String password =hash.toString();
		System.out.println(password);
	}
}
