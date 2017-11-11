package com.other.currency;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class ServiceResponse<T> implements Serializable{
	
	private int status;
	private String msg;
	private T data;
	
	private ServiceResponse(int status) {
		this.status = status;
	}
	
	private ServiceResponse(int status, String msg){
		this.status = status;
		this.msg = msg;
	}
	
	private ServiceResponse(int status, T data){
		this.status = status;
		this.data = data;
	}
	
	private ServiceResponse(int status, T date, String msg){
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
	
	public static <T> ServiceResponse<T> createBySuccess(){
		return new ServiceResponse<T>(ResponseCode.SUCCESS.getCode());
	}
	
	public static <T> ServiceResponse<T> createBySuccess(T data){
        return new ServiceResponse<T>(ResponseCode.SUCCESS.getCode(), data);
    }
	
	public static <T> ServiceResponse<T> createBySuccessMessage(String msg){
		return new ServiceResponse<T>(ResponseCode.SUCCESS.getCode(), msg);
	}
	
	public static <T> ServiceResponse<T> createBySuccess(String msg, T data){
        return new ServiceResponse<T>(ResponseCode.SUCCESS.getCode(), data, msg);
    }
	
	public static <T> ServiceResponse<T> createError(){
        return new ServiceResponse<T>(ResponseCode.ERROR.getCode());
    }

	public static <T> ServiceResponse<T> createByErrorMassage(String msg){
        return new <T>ServiceResponse<T>(ResponseCode.ERROR.getCode(), msg);
    }
	
	public static <T> ServiceResponse<T> createByErrorCodeMessage(int errorCode, String errorMessage){
        return new <T>ServiceResponse<T>(errorCode, errorMessage);
    }
}
