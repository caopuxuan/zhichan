package com.bpm.asset.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bpm.asset.entity.Classify;
import com.bpm.asset.entity.Dictionary;

@Mapper
public interface DictionaryDao {

	@Select("select types,valued from t_dim_dictionary where code=#{code}")
	List<Dictionary> findByCode(@Param("code") String code);
	
	@Select("select types,valued from t_dim_dictionary_unit where code=#{code}")
	List<Dictionary> findByCodeUnit(@Param("code") String code);
	
	@Select("select code,name,pid from t_classify where substr(code,3,1)=#{code}")
	List<Classify> findByClassifyCode(@Param("code") String code);

}
