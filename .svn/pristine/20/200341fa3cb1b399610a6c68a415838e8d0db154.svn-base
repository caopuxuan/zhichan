package com.bpm.asset.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bpm.asset.entity.Appurtenance;

import core.mybatis.languageDriver.SimpleInsertLangDriver;

@Mapper
public interface AppurtenanceDao {
	@Insert("INSERT INTO t_asset_appurtenance  (#{Appurtenance})")
	@Lang(SimpleInsertLangDriver.class)
	int add(Appurtenance Appurtenance);

	@Delete("delete from t_asset_appurtenance  where id=#{id}")
	int deleteById(Integer id);

	@Delete("delete from t_asset_appurtenance  where card_number=#{id}")
	int deleteByCId(String id);

	@Select("select * from t_asset_appurtenance  where card_number=#{id}")
	List<Appurtenance> findById(String id);
}
