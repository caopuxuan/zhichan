package com.bpm.asset.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bpm.asset.entity.HouseInstitutions;

import core.mybatis.languageDriver.SimpleInsertLangDriver;

@Mapper
public interface HouseInstitutionsDao {
	@Insert("INSERT INTO t_asset_house_institutions  (#{HouseInstitutions})")
	@Lang(SimpleInsertLangDriver.class)
	int add(HouseInstitutions HouseInstitutions);

	@Delete("delete from t_asset_house_institutions  where id=#{id}")
	int deleteById(Integer id);

	@Delete("delete from t_asset_house_institutions  where card_number=#{id}")
	int deleteByCId(String id);

	@Select("select * from t_asset_house_institutions  where card_number=#{id}")
	List<HouseInstitutions> findById(String id);
}
