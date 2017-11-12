package com.other.shiro;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;

public class TestPassowrd {
	public static void main(String[] args) {
		//加盐
        String saltSource = "chiji";    
        String hashAlgorithmName = "MD5";
        //密码
        String credentials = "admin";
        Object salt = new Md5Hash(saltSource);
        //循环次数
        int hashIterations = 50;            
        Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
        System.out.println(result);
    }
}
