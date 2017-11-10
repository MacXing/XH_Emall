package com.other.currency;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class ServerResponse<T> implements Serializable{
	
	private int status;
	private String msg;
	private T data;
	
	private ServerResponse(int status) {
		this.status = status;
	}
	
	private ServerResponse(int status, String msg){
		this.status = status;
		this.msg = msg;
	}
	
	private ServerResponse(int status, T data){
		this.status = status;
		this.data = data;
	}
	
	private ServerResponse(int status, T date, String msg){
        this.status = status;
        this.data = date;
        this.msg = msg;
    }
	
	// 不在json中
	@JsonIgnore
	public boolean isSuccess(){
		return this.status == ResponseCode.SUCCESS.getCode();
	}

	public int getStatus() {
		return status;
	}

	public String getMsg() {
		return msg;
	}

	public T getData() {
		return data;
	}
	
	public static <T> ServerResponse<T> createBySuccess(){
		return new ServerResponse<T>(ResponseCode.SUCCESS.getCode());
	}
	
	public static <T> ServerResponse<T> createBySuccess(T data){
        return new ServerResponse<T>(ResponseCode.SUCCESS.getCode(), data);
    }
	
	public static <T> ServerResponse<T> createBySuccessMessage(String msg){
		return new ServerResponse<T>(ResponseCode.SUCCESS.getCode(), msg);
	}
	
	public static <T> ServerResponse<T> createBySuccess(String msg, T data){
        return new ServerResponse<T>(ResponseCode.SUCCESS.getCode(), data, msg);
    }
	
	public static <T> ServerResponse<T> createError(){
        return new ServerResponse<T>(ResponseCode.ERROR.getCode());
    }

	public static <T> ServerResponse<T> createByErrorMassage(String msg){
        return new <T>ServerResponse<T>(ResponseCode.ERROR.getCode(), msg);
    }
	
	public static <T> ServerResponse<T> createByErrorCodeMessage(int errorCode, String errorMessage){
        return new <T>ServerResponse<T>(errorCode, errorMessage);
    }
}
