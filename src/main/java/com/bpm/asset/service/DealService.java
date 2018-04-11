package com.bpm.asset.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bpm.asset.entity.Deal;
import com.bpm.asset.vo.DealVo;

@Service
public interface DealService {
	//处置条件查询
	public List<Deal> findByBT(String column);
	//删除
	public int deleteDeal(String deal_number);
	//新增
	public int addDeal(DealVo DealVo);
    //更新
	public int updateDeal(DealVo DealVo);
	//编辑查询
	public DealVo findDealById(String cid);
	//提交审核
	public int updatebyDid(String dealNumber,int dealStatus,String auditOpinion);
	//流程新增，更新
	public void updateDeal1(Deal deal);
	
}
