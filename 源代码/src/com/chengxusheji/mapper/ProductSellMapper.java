package com.chengxusheji.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.chengxusheji.po.ProductSell;

public interface ProductSellMapper {
	/*添加宠物预售信息*/
	public void addProductSell(ProductSell productSell) throws Exception;

	/*按照查询条件分页查询宠物预售记录*/
	public ArrayList<ProductSell> queryProductSell(@Param("where") String where,@Param("startIndex") int startIndex,@Param("pageSize") int pageSize) throws Exception;

	/*按照查询条件查询所有宠物预售记录*/
	public ArrayList<ProductSell> queryProductSellList(@Param("where") String where) throws Exception;

	/*按照查询条件的宠物预售记录数*/
	public int queryProductSellCount(@Param("where") String where) throws Exception; 

	/*根据主键查询某条宠物预售记录*/
	public ProductSell getProductSell(int sellId) throws Exception;

	/*更新宠物预售记录*/
	public void updateProductSell(ProductSell productSell) throws Exception;

	/*删除宠物预售记录*/
	public void deleteProductSell(int sellId) throws Exception;

}
