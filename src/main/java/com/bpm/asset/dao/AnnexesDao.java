package com.bpm.asset.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bpm.asset.entity.Annexes;

import core.mybatis.languageDriver.SimpleInsertLangDriver;

@Mapper
public interface AnnexesDao {
	@Insert("INSERT INTO t_annexes  (#{Annexes})")
	@Lang(SimpleInsertLangDriver.class)
	int add(Annexes Annexes);

	@Delete("delete from t_annexes  where id=#{id}")
	int deleteById(Integer id);

	@Delete("delete from t_annexes  where deal_number=#{id}")
	int deleteByDId(String id);

	@Select("select * from t_annexes  where deal_number=#{id}")
	List<Annexes> findById(String id);
}
