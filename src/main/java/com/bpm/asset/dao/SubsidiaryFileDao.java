package com.bpm.asset.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bpm.asset.entity.SubsidiaryFile;

import core.mybatis.languageDriver.SimpleInsertLangDriver;

@Mapper
public interface SubsidiaryFileDao {
	@Insert("INSERT INTO t_asset_subsidiary_file  (#{SubsidiaryFile})")
	@Lang(SimpleInsertLangDriver.class)
	int add(SubsidiaryFile SubsidiaryFile);

	@Delete("delete from t_asset_subsidiary_file  where id=#{id}")
	int deleteById(Integer id);

	@Delete("delete from t_asset_subsidiary_file  where card_number=#{id}")
	int deleteByCId(String id);

	@Select("select * from t_asset_subsidiary_file  where card_number=#{id}")
	List<SubsidiaryFile> findById(String id);

}
