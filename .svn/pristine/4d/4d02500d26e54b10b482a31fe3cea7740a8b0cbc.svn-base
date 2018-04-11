package com.bpm.asset.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bpm.asset.entity.Asset;

import core.mybatis.languageDriver.SimpleInsertLangDriver;
import core.mybatis.languageDriver.SimpleSelectLangDriver;
import core.mybatis.languageDriver.SimpleUpdateLangDriver;

@Mapper
public interface AssetDao {

	// 提交更改状态 参数列表： 卡片编号，审核提交状态，审核意见
	@Update("UPDATE t_asset set audit_state=#{audit_state},audit_opinion=#{audit_opinion}  WHERE card_number in (${card_number})")
	int updatebyCid(@Param("card_number") String card_number, @Param("audit_state") int audit_state,
			@Param("audit_opinion") String audit_opinion);

	// 处置新增更改状态 待处置 删除更改状态为 已审核 参数列表： 处置状态，处置单号，资产卡片编号
	@Update("UPDATE t_asset set audit_state=#{auditState},deal_number=#{dealNumber} WHERE card_number=#{cardNumber}")
	int updateDealbyCid(@Param("auditState") int auditState, @Param("dealNumber") String dealNumber,
			@Param("cardNumber") String cardNumber);

	// 资产处置删除时更新资产卡片状态为已审核 参数列表： 处置单号
	@Update("UPDATE t_asset set audit_state=3 WHERE deal_number=#{dealNumber}")
	int updateDealbyDid(@Param("dealNumber") String dealNumber);

	// 资产处置审核通过更新资产卡片状态为已处置 参数列表： 处置单号
	@Update("UPDATE t_asset set audit_state=5 WHERE deal_number=#{dealNumber}")
	int updateAssetbyDid(@Param("dealNumber") String dealNumber);

	// 编辑
	@Update("UPDATE t_asset (#{as}) WHERE card_number=#{cardNumber}")
	@Lang(SimpleUpdateLangDriver.class)
	int update(Asset as);

	// 新增
	@Insert("INSERT INTO t_asset (#{Asset})")
	@Lang(SimpleInsertLangDriver.class)
	int add(Asset Asset);

	// 删除
	@Delete("delete from t_asset where card_number=#{cardNumber}")
	int deleteById(String cardNumber);

	// 编辑时查找的单条数据
	@Select("select * from t_asset where card_number=#{cardNumber}")
	Asset findById(String cardNumber);

	// 首页面查找用户组下的全部数据 参数列表 用户组id，用户id，资产名称，使用部门，使用状态，提交审核状态
	@Select("select * from t_asset where 1=1 ${column}")
	@Lang(SimpleSelectLangDriver.class)
	List<Asset> findByBT(@Param("column") String column);

	// 处置时查找相关资产卡片 只能选择已审核状态的资产卡片
	@Select("select * from t_asset where deal_number=#{dealNumber}")
	List<Asset> findByDId(String dealNumber);
	
	// 首页面查找用户组下的全部数据 参数列表 用户组id，用户id，资产名称，使用部门，使用状态，提交审核状态
	@Select("select * from t_asset where 1=1 ${column}")
	@Lang(SimpleSelectLangDriver.class)
	List<Asset> findByTZ(@Param("column") String column);
	
}
