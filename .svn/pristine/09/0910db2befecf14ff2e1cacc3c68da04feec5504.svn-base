package com.bpm.asset.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.atools.config.power.model.User;
import com.bpm.asset.entity.Asset;
import com.bpm.asset.entity.Deal;
import com.bpm.asset.tools.RestUtils;
import com.bpm.asset.vo.AssetVo;
import com.bpm.asset.vo.DealVo;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@RestController
@Api(value = "资产")
public class DealController {

	// private Logger logger = LogManager.getLogger(this.getClass());

	@Value("${flowUrlpath}")
	private String flowUrlpath;
	@Resource
	private com.bpm.asset.service.DealService DealService;
	
	@ApiOperation(value = "新增处置单", notes = "新增处置单")
	@PostMapping(value = "/addDeal")
	@ApiImplicitParam(name = "DealVo", value = "资产整体实体", dataType = "DealVo")
	public int addDeal(@RequestBody DealVo DealVo) {
		return DealService.addDeal(DealVo);
	}

	@ApiOperation(value = "处置编辑查询", notes = "处置编辑查询")
	@PostMapping(value = "/findDealById")
	@ApiImplicitParam(name = "dealNumber", value = "处置编号", required = true, dataType = "String", paramType = "query")
	public DealVo findDealById(@RequestParam String dealNumber) {
		return DealService.findDealById(dealNumber);
	}

	@ApiOperation(value = "编辑处置单", notes = "编辑处置单")
	@PostMapping(value = "/updateDeal")
	@ApiImplicitParam(name = "DealVo", value = "资产整体实体", dataType = "DealVo")
	public int updateDeal(@RequestBody DealVo DealVo) {
		return DealService.updateDeal(DealVo);
	}

	@ApiOperation(value = "删除", notes = "删除")
	@PostMapping(value = "/deleteDeal")
	@ApiImplicitParam(name = "dealNumber", value = "卡片编号", required = true, dataType = "String", paramType = "query")
	public int deleteDeal(@RequestParam String dealNumber) {
		return DealService.deleteDeal(dealNumber);
	}

	@ApiOperation(value = "处置申请查询", notes = "处置申请查询")
	@PostMapping(value = "/findDealByBT")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "group_id", value = "用户组id", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "user_id", value = "用户id", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "deal_number", value = "申请单号", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "application_unit", value = "申请单位", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "deal_mode", value = "处置方式", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "deal_status", value = "提交审核状态", required = false, dataType = "String", paramType = "form")})
	public List<Deal> findByBT(
			@RequestParam(required = false) String group_id,
			@RequestParam(required = false) String user_id, 
			@RequestParam(required = false) String deal_number,
			@RequestParam(required = false) String application_unit,
			@RequestParam(required = false) String deal_mode,
			@RequestParam(required = false) String deal_status) {
		
		System.out.print("deal_number="+deal_number+"application_unit="+application_unit+"deal_mode="+deal_mode+"deal_status="+deal_status);
		
		String sql="";
		
		if(group_id!=null){
			if(!group_id.equals("")){
			sql=sql+"and group_id='"+group_id+"'";
			}
		}
		if(user_id!=null){
			if(!user_id.equals("")){
			sql=sql+"and user_id='"+user_id+"'";
			}
		}
		
		if(deal_number!=null){
			if(!deal_number.equals("")){
			sql=sql+"and deal_number='"+deal_number+"'";
			}
		}
		if(application_unit!=null){
			if(!application_unit.equals("")){
			sql=sql+"and application_unit='"+application_unit+"'";
			}
		}
		if(deal_mode!=null){
			if(!deal_mode.equals("")){
			sql=sql+"and deal_mode='"+deal_mode+"'";
			}
		}

		if(deal_status!=null){
			if(!deal_status.equals("")){
			sql=sql+"and deal_status in ("+deal_status+")";
			}
		}

		System.out.println(sql);
		return DealService.findByBT(sql);

	}

	@ApiOperation(value = "提交审核", notes = "提交审核")
	@PostMapping(value = "/updatebyDid")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "dealNumber", value = "卡片编号", required = true, dataType = "String", paramType = "query"),
		@ApiImplicitParam(name = "dealStatus", value = "审核状态", required = false, dataType = "Integer", paramType = "form"),
		@ApiImplicitParam(name = "params", value = "审核要素", required = false, dataType = "String", paramType = "form"),
		@ApiImplicitParam(name = "auditOpinion", value = "审核意见", required = false, dataType = "String", paramType = "form") })
public int updatebyCid(@RequestParam String dealNumber, @RequestParam(required = false) Integer dealStatus,
		@RequestParam(required = false) String auditOpinion,String params,HttpServletRequest request,HttpServletResponse response) {
	if(dealNumber.contains("' ',")){
		dealNumber=dealNumber.substring(4,dealNumber.length());
	}
	String [] s=dealNumber.split(",");

	int r=0;
	for(int m=0;m<s.length;m++){
		String dealNumber1=s[m].substring(1,s[m].length()-1);
		System.out.println(dealNumber1);
	
	//获取session中的信息，给外部流程的方法需要的参数赋值
	Integer dealStatus1=dealStatus;
	HttpSession session=request.getSession();
    User user=(User)session.getAttribute("user");
	String orgId=(String)session.getAttribute("orgId");
	String businessId=dealNumber1;
	DealVo dvo=DealService.findDealById(dealNumber1);
	Deal deal=dvo.getDeal();
	String processInstanceId=null;
	String bpmId = deal.getBpmId();
	
	if(dealStatus1==1 || dealStatus1==3){
		if (bpmId == null || "".equals(bpmId)) {		
			Map<String, Object> paramMap= new HashMap<>();
			paramMap.put("bpmClassifyName", "0701");
			paramMap.put("businessArea", "07");
			paramMap.put("businessId",businessId);	
			paramMap.put("orgId",orgId);
			String paramString=JSONObject.fromObject(paramMap).toString();
			//1.调用bpm3流程的接口（测试）-查询流程定义
			String ob=RestUtils.executePost(flowUrlpath+"jbpm/findZcCentralizeByParams",paramString);
			Map<String,Object> map2 = (Map)JSONObject.fromObject(ob);
			String processDeploymentId=map2.get("processDeploymentId").toString();
			Map<String, Object> variables = (Map)(map2.get("variables"));
			
			variables.put("userId",user.getUserId());
			variables.put("businessId",businessId);
			variables.put("tenantCode", 204);
			variables.put("OrgId",orgId);
			Map<String, Object> paramMap1=new HashMap<>();
			paramMap1.put("processDeploymentId", processDeploymentId);
			paramMap1.put("variables", variables);
			String paramString1=JSONObject.fromObject(paramMap1).toString();
			//2.调用bpm3流程的接口（测试）-获取流程实例id		
			processInstanceId=RestUtils.executePost(flowUrlpath+"jbpm/startProcessInstanceAndComplateFirstTask",paramString1);
			deal.setBpmId(processInstanceId);
			
			Map<String, Object> paramMap2=new HashMap<>();
			paramMap2.put("processInstanceId", processInstanceId);
			String paramString2=JSONObject.fromObject(paramMap2).toString();
			//3.调用bpm3流程的接口-判断实例的状态
			String b=RestUtils.executePost(flowUrlpath+"jbpm/isEnd",paramString2);
			if(dealStatus1==1){
				if(b.equalsIgnoreCase("true")){
					//流程结束
					//执行申请走完制单之后直接结束，这种情况待讨论
					deal.setDealStatus(3);
				}else{
					//待审批需要走流程				
					deal.setDealStatus(3);
				}
			}
			if(dealStatus1==3){
				if(b.equalsIgnoreCase("true")){
					//流程结束
					//执行申请走完制单之后直接结束，这种情况待讨论
					deal.setDealStatus(3);
				}else{
					//待审批需要走流程				
					deal.setDealStatus(3);
				}
			}
		}else{
			// 若提交的数据为退回的数据则不用生成流程事例
			Map<String, Object> paramMap3=new HashMap<>();
			paramMap3.put("bpmId", bpmId);
			paramMap3.put("userId", user.getUserId());//需要修改，从记录中获取
			paramMap3.put("outcome", "通过");
			String paramString3=JSONObject.fromObject(paramMap3).toString();
			//3.调用bpm3流程的接口-流程任务执行
			String b=RestUtils.executePost(flowUrlpath+"jbpm/doTask",paramString3);
			if(dealStatus1==1) deal.setDealStatus(3);
			if(dealStatus1==3) deal.setDealStatus(3);
		}
		// 提交
		DealService.updateDeal1(deal);
		r=DealService.updatebyDid(dealNumber, dealStatus, auditOpinion);
		
		//提交功能查询审核要素
		Map<String, Object> paramMap4=new HashMap<String, Object>();
		paramMap4.put("bpmId", deal.getBpmId());
		if(dealStatus1==1) paramMap4.put("state", "1");
		if(dealStatus1==3) paramMap4.put("state", "3");
		paramMap4.put("orgId", orgId);
		paramMap4.put("tenantCode", session.getAttribute("tenantCode"));
		String paramString4=JSONObject.fromObject(paramMap4).toString();
		//4.调用bpm3流程的接口-查询审核要素
		// POINT 字段为审核状态的属性名，建议前台审核要素字段属性 name 设置为POINT 		 
		String list=RestUtils.executePost(flowUrlpath+"jbpm/findApprovalElement",paramString4);
		JSONArray jsonArray=JSONArray.fromObject(list);   
		List<Map<String,Object>> elementlist = (List<Map<String, Object>>)JSONArray.toList(jsonArray, Map.class);
		String Element="";
		for(int j=0;j<elementlist.size();j++){
			Element=Element+"1:"+elementlist.get(j).get("POINT")+",";
		}
		if(!"".equals(Element)){
			Element=Element.substring(0, Element.length()-1);
		}
		//添加纪录日志
		Map<String, Object> paramMap5=new HashMap<String, Object>();
		paramMap5.put("businessId", businessId);
		if(dealStatus1==1) paramMap5.put("source", "zc");
		if(dealStatus1==3) paramMap5.put("source", "zccl");
		paramMap5.put("creator", user.getName());
		paramMap5.put("creatorId",user.getUserId());
		paramMap5.put("auditLink","制单");
		paramMap5.put("auditElements",Element);
		DealVo dvo1=DealService.findDealById(dealNumber1);
		paramMap5.put("viewObject",dvo1);
		String paramString5=JSONObject.fromObject(paramMap5).toString();
		//5.调用bpm3流程的接口-添加日志 		 
		String audit=RestUtils.executePost(flowUrlpath+"jbpm/addAuditLog",paramString5);
	}
	if(dealStatus1==2 ||dealStatus1==4){
		
		Map<String,Object> paramsMap=(Map)JSONObject.fromObject(params);
		Map<String, Object> taskParams=new HashMap<>();
		//1.查询流程部署Id和流程节点名称
		Map<String, Object> paramMap01=new HashMap<String, Object>();
		paramMap01.put("bpmId", deal.getBpmId());
		String paramString01=JSONObject.fromObject(paramMap01).toString();
		//调用jbpm/findFlowsInfo(String bpmId) 方法
		String map = RestUtils.executePost(flowUrlpath+"jbpm/findFlowsInfo",paramString01);			
        JSONObject jsonObject = JSONObject.fromObject(map);	         
        Map<String, Object> map6 = JSONObject.fromObject(jsonObject);

		String auditLink=(String)map6.get("taskName");
		
		taskParams.put("bpmId", deal.getBpmId());
		taskParams.put("candidate", user.getUserId());
		String postIdsString="";
		for(String postId:(Set<String>)session.getAttribute("postIds")){
			postIdsString=postIdsString+postId+",";
		}
		postIdsString=postIdsString.substring(0, postIdsString.length()-1);
		taskParams.put("postIdsString", postIdsString);
					
		//2.完成审批
		Map<String, Object> logParams=new HashMap<>();
		String outComeName = paramsMap.get("state").toString();
//		String outComeName = "通过";
		if("通过".equals(outComeName/*applicationForm.getState()*/)){
			taskParams.put("state", "通过");
			logParams.put("state", "1");
			logParams.put("statename", "通过");
		}else{
			taskParams.put("state",outComeName );
			logParams.put("state", "0");
			logParams.put("statename", "回退");
		}
		//调用jbpm/doTask1(Map<String, Object> params) 方法
		String paramString02=JSONObject.fromObject(taskParams).toString();
		String map02 = RestUtils.executePost(flowUrlpath+"jbpm/doTask1",paramString02);		
		Map<String,Object> map7 = (Map)JSONObject.fromObject(map02);
		System.out.println("***********map7:"+map7+"***********");
		if(!map7.isEmpty()){
			boolean result=(boolean)map7.get("result");
			if(result){//流程结束的情况下，更新执行申请单的状态
				if(dealStatus1==2)deal.setDealStatus(3);
				if(dealStatus1==4)deal.setDealStatus(5);
				deal.setBpmId("");
				
			}
		}
		
		DealService.updateDeal1(deal);
		r=DealService.updatebyDid(dealNumber, dealStatus, auditOpinion);
		//3.保存日志			
		if(dealStatus1==2) logParams.put("source", "zc");
		if(dealStatus1==4) logParams.put("source", "zccz");
		String postId=(String)map6.get("postId");
		if(postId!=null){
			logParams.put("postId", "postId");
		}
		
		List<Map<String, Object>> rowCheck= (List<Map<String, Object>>) paramsMap.get("rowCheck");//前台选中数据
		List <Map<String, Object>> rowAll=(List<Map<String, Object>>) paramsMap.get("rowAll");//前台所有数据
		String AUDIT_ELEMENT="";
		for(int i=0;i<rowCheck.size();i++){
			for(int j=0;j<rowAll.size();j++){//把两个list相同数据拼取出来拼接，并在rowAll中删除，只留不同数据
				if(rowCheck.get(i).get("POINT").equals(rowAll.get(j).get("POINT"))){
					AUDIT_ELEMENT=AUDIT_ELEMENT+1+":"+rowAll.get(j).get("POINT")+",";
					rowAll.remove(j);
				}
				
			}
		}
		if(!rowAll.isEmpty()){//把不同数据拼0
			for(int k=0;k<rowAll.size();k++){
				AUDIT_ELEMENT=AUDIT_ELEMENT+0+":"+rowAll.get(k).get("POINT")+",";
			}
		}
		if(!"".equals(AUDIT_ELEMENT))
		AUDIT_ELEMENT=AUDIT_ELEMENT.substring(0, AUDIT_ELEMENT.length()-1);
		
		logParams.put("auditElements", AUDIT_ELEMENT);
		logParams.put("auditLink", auditLink);
		logParams.put("businessId", dealNumber1);
		String remark=paramsMap.get("remark") == null || "".equals(paramsMap.get("remark")) ? "通过" : paramsMap.get("remark").toString();
		logParams.put("logs", remark);
		logParams.put("creator", user.getName());
		logParams.put("creatorId", user.getUserId());
		String paramString03=JSONObject.fromObject(logParams).toString();
		//调用jbpm/addAuditLog(Map<String, Object> params) 方法
		String map03 = RestUtils.executePost(flowUrlpath+"jbpm/addAuditLog",paramString03);
		System.out.println("***********3:"+map03+"***********");
		
		
	}
	}
//	int i=AssetService.updatebyCid(cardNumber, auditState, auditOpinion);
	return r;
}

}
