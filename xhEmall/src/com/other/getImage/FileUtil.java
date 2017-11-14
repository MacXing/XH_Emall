package com.other.getImage;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	/**
	 * 
	 * @param filePath:删除的文件所在路径
	 * @param fileName：删除的文件名称
	 * @throws Exception
	 */
	public static void deleteFile(String filePath, String fileName)
			throws Exception {
		File file = new File(filePath + fileName);
		if (file.exists()) {
			file.delete();
		}
	}
	
	/**
	 * 上传文件
	 * @param file：上传的文件对象
	 * @param savePath：保存路劲
	 * @param fileName：文件名，包括后缀名
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static String uploadFile(MultipartFile file,String savePath,String fileName) throws IllegalStateException, IOException{
		
		File dir =new File(savePath);    
		//如果文件夹不存在则创建    
		if  (!dir .exists()  && !dir .isDirectory())      
		{       
		    System.out.println("//不存在");  
		    dir .mkdirs();   
		} else   
		{  
		    System.out.println("//目录存在");  
		}    
		
		String extName=fileName.substring(fileName.lastIndexOf("."));
		fileName = UUID.randomUUID().toString();
		String path=savePath+File.separator+fileName+extName;
		File newfile=new File(path);
		file.transferTo(newfile);
		return fileName+extName;
	}

}
