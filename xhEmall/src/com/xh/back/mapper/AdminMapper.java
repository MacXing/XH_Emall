package com.xh.back.mapper;

import java.util.List;
import java.util.Map;

import com.xh.back.bean.Xhadmin;


public interface AdminMapper {
	
   public Xhadmin selectAdminByName(Xhadmin admin);
   
   public void updateAdminIpAndTime(Xhadmin admin);
   
   /**
    * 14.queryAdminList - 查询所有管理员
    * @return List        - 执行结果
    * @throws Exception  - 异常捕捉
    */
   public List<Xhadmin> queryAdminList() throws Exception;
   
   /**
    * 1.新增一条数据
    * 注: 根据Bean实体执行新增操作.
    * @param Xhadmin     - 
    * @throws Exception  - 异常捕捉
    */
   public int addAdmin(Xhadmin Xhadmin) throws Exception;


   /**
    * 2.删除一条数据
    * 注: 根据Bean实体的主键ID执行删除操作.
    * @param adminid     - 
    * @return int        - 执行结果
    * @throws Exception  - 异常捕捉
    */
   public int deleteAdminById(int id) throws Exception;


   /**
    * 3.变更一条数据
    * 注: 根据Bean实体的主键ID执行变更操作.
    * @param Xhadmin     - 
    * @return int        - 执行结果
    * @throws Exception  - 异常捕捉
    */
   public int modifyAdmin(Xhadmin Xhadmin) throws Exception;


   /**
    * 4.获取一个Bean实体
    * 注: 根据Bean实体的主键ID获取一个Bean实体.
    * @param adminid     - 
    * @return Xhadmin    - 执行结果
    * @throws Exception  - 异常捕捉
    */
   public Xhadmin getAdmin(Integer adminid) throws Exception;


   /**
    * 5.条件查询
    * 注: 支持多条件查询、模糊查询、日期比较查询等操作.
    * @param Xhadmin         - 
    * @return List<Xhadmin>  - 执行结果
    * @throws Exception      - 异常捕捉
    */
   public List<Xhadmin> getList(Xhadmin Xhadmin) throws Exception;


   /**
    * 6.分页查询
    * 注: 支持分页查询、多条件查询、模糊查询、日期比较查询等操作.
    * @param map             - 及分页信息
    * <br>[参数说明] 如下 , map中有3个固定Key , 且区分大小写.
    * <br>[键1] bean -  (实体)
    * <br>[键2] offset - 偏移量 (分页信息)
    * <br>[键3] rows - 数目 (分页信息)
    * @return List<Xhadmin>  - 执行结果
    * @throws Exception      - 异常捕捉
    */
   public List<Xhadmin> getPageList(Map<String ,Object> map) throws Exception;

   /**
    * 8.删除多条数据
    * 注: 根据拼接有限个主键ID执行多条数据的删除操作.
    * @param adminids    - 
    * @return int        - 执行结果
    * @throws Exception  - 异常捕捉
    */
   public int getDeleteIn(Integer[] adminids) throws Exception;


   /**
    * 9.条件删除数据
    * 注: 根据多种条件执行批量删除操作.
    * @param Xhadmin     - 
    * @return int        - 执行结果
    * @throws Exception  - 异常捕捉
    */
   public int getDeleteBy(Xhadmin Xhadmin) throws Exception;


   /**
    * 10.验证多条件数据是否存在
    * 注: 根据多条件验证该数据是否存在 ,并返回数据量.
    * @param Xhadmin     - 
    * @return int        - 存在数量
    * @throws Exception  - 异常捕捉
    */
   public int getCheckBy(Xhadmin Xhadmin) throws Exception;


   /**
    * 11.按条件变更一条数据
    * 注: 根据Bean实体的主键ID,只对部分字段执行变更操作.
    * @param Xhadmin     - 
    * @return int        - 执行结果
    * @throws Exception  - 异常捕捉
    */
   public int getUpdateBy(Xhadmin Xhadmin) throws Exception;


   /**
    * 12.InsertBatch - 批量新增数据
    * 注: 根据List对象执行批量新增操作.
    * @param list        - List
    * @throws Exception  - 异常捕捉
    */
   public void getInsertBatch(List<Xhadmin> list) throws Exception;


   /**
    * 13.UpdateBatch - 批量更新数据
    * 注: 根据List对象执行批量更新操作.
    * @param list        - List
    * @throws Exception  - 异常捕捉
    */
   public void getUpdateBatch(List<Xhadmin> list) throws Exception;
   
   /**
    * 用于shiro的查找
    * @param name
    * @return
    */
   public Xhadmin queryAdminByName(String name);
    
}