package com.bpm.asset.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.atools.config.power.model.User;
import com.bpm.asset.entity.Asset;
import com.bpm.asset.entity.Classify;
import com.bpm.asset.entity.Dictionary;
import com.bpm.asset.service.AssetService;
import com.bpm.asset.tools.RestUtils;
import com.bpm.asset.vo.AssetVo;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@RestController
@Api(value = "资产")
public class AssetController {
	
	@Value("${flowUrlpath}")
	private String flowUrlpath;

	// private Logger logger = LogManager.getLogger(this.getClass());
	
	
	@ApiOperation(value="资产卡片维护", notes="资产卡片维护")
	@GetMapping(value = "/maintenance") 
    public void maintenance(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("*****进入*****");
		
				try {
					request.getRequestDispatcher("/view/asset/Asset-maintenance.jsp").forward(request,response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		
    }
	@ApiOperation(value="资产卡片审核", notes="资产卡片审核")
	@GetMapping(value = "/audit") 
    public void audit(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("*****进入*****");
		
				try {
					request.getRequestDispatcher("/view/asset/Asset-audit.jsp").forward(request,response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		
    }
	@ApiOperation(value="资产处置申请", notes="资产处置申请")
	@GetMapping(value = "/application") 
    public void application(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("*****进入*****");
		
				try {
					request.getRequestDispatcher("/view/asset/Asset-application.jsp").forward(request,response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		
    }
	@ApiOperation(value="资产处置审批", notes="资产处置审批")
	@GetMapping(value = "/approval") 
    public void approval(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("*****进入*****");
		
				try {
					request.getRequestDispatcher("/view/asset/Asset-approval.jsp").forward(request,response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		
    }
	@ApiOperation(value="资产新增处置查询", notes="资产新增处置查询")
	@GetMapping(value = "/disposal") 
    public void disposal(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("*****进入*****");
		
				try {
					request.getRequestDispatcher("/view/asset/Asset-disposal.jsp").forward(request,response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		
    }
	@ApiOperation(value="资产汇总查询", notes="资产汇总查询")
	@GetMapping(value = "/query") 
    public void query(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("*****进入*****");
		
				try {
					request.getRequestDispatcher("/view/asset/Asset-query.jsp").forward(request,response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		
    }
	@ApiOperation(value="资产台账", notes="资产台账")
	@GetMapping(value = "/account") 
    public void account(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("*****进入*****");
		
				try {
					request.getRequestDispatcher("/view/asset/Asset-account.jsp").forward(request,response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
    }
	
	@Resource
	private AssetService AssetService;

	@ApiOperation(value = "新增资产", notes = "新增资产")
	@PostMapping(value = "/addAsset")
	@ApiImplicitParam(name = "AssetVo", value = "资产整体实体", dataType = "AssetVo")
	public int addAsset(@RequestBody AssetVo AssetVo,HttpServletRequest request) {
		 HttpSession session=request.getSession();
		 User user=(User)session.getAttribute("user");
		 String tenantCode=(String)session.getAttribute("tenantCode");
		 String orgId=(String)session.getAttribute("orgId");
		 Asset asset=AssetVo.getAsset();		
		 asset.setUserId(user.getUserId());
		 asset.setUserName(user.getName());
		 asset.setTenantCode(tenantCode);
		 asset.setOrgId(orgId);
		return AssetService.addAsset(AssetVo);
	}

	@ApiOperation(value = "编辑查询", notes = "编辑查询")
	@PostMapping(value = "/findAssetById")
	@ApiImplicitParam(name = "cardNumber", value = "卡片编号", required = true, dataType = "String", paramType = "query")
	public AssetVo findAssetById(@RequestParam String cardNumber) {
		return AssetService.findAssetById(cardNumber);
	}

	@ApiOperation(value = "编辑资产", notes = "编辑资产")
	@PostMapping(value = "/updateAsset")
	@ApiImplicitParam(name = "AssetVo", value = "资产整体实体", dataType = "AssetVo")
	public int updateAsset(@RequestBody AssetVo AssetVo) {
		return AssetService.updateAsset(AssetVo);
	}

	@ApiOperation(value = "删除", notes = "删除")
	@PostMapping(value = "/deleteAsset")
	@ApiImplicitParam(name = "cardNumber", value = "卡片编号", required = true, dataType = "String", paramType = "query")
	public int deleteAsset(@RequestParam String cardNumber) {
		return AssetService.deleteAsset(cardNumber);
	}

	@ApiOperation(value = "资产列表", notes = "资产列表")
	@PostMapping(value = "/findAssetByBT")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "group_id", value = "用户组id", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "user_id", value = "用户id", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "asset_name", value = "资产名称", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "use_department", value = "使用部门", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "using_state", value = "使用状态", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "audit_state", value = "提交审核状态", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "using_state", value = "页面名称", required = false, dataType = "String", paramType = "form")})
	public List<Asset> findByBT(
			@RequestParam(required = false) String group_id,
			@RequestParam(required = false) String user_id, 
			@RequestParam(required = false) String asset_name,
			@RequestParam(required = false) String use_department, 
			@RequestParam(required = false) String using_state,
			@RequestParam(required = false) String audit_state,
			@RequestParam(required = false) String pageName,HttpServletRequest request) {
		
		String sql="";
		
		if(group_id!=null){
			if(!group_id.equals("")){
			sql=sql+"and group_id='"+group_id+"'";
			}
		}
		if("editPage".equalsIgnoreCase(pageName)){
			HttpSession session1=request.getSession();
			user_id=((User)session1.getAttribute("user")).getUserId();
			if(user_id!=null){
				if(!user_id.equals("")){
				sql=sql+"and user_id='"+user_id+"'";
				}
			}
		}
		HttpSession session2=request.getSession();
		String org_id=((String)session2.getAttribute("orgId"));
		if(org_id!=null){
			if(!org_id.equals("")){
			sql=sql+"and org_id='"+org_id+"'";
			}
		}
		if(asset_name!=null){
			if(!asset_name.equals("")){
			sql=sql+"and asset_name='"+asset_name+"'";
			}
		}
		if(use_department!=null){
			if(!use_department.equals("")){
			sql=sql+"and use_department='"+use_department+"'";
			}
		}
		
		if(using_state!=null){
			if(!using_state.equals("")){
			sql=sql+"and using_state='"+using_state+"'";
			}
		}

		if(audit_state!=null){
			if(!audit_state.equals("")){
			sql=sql+"and audit_state in ("+audit_state+")";
			}
		}
		//过滤数据，调用bpm3接口http://192.168.8.105:8080/jbpm/filterTasks
		List<Asset> assetList=AssetService.findByBT(sql);
		List<Asset> assetList1=new ArrayList<>();
		List<Asset> assetList2=new ArrayList<>();
		//根据bpmId，将数据分成两类，为空的不需要过滤，不为空的过滤
		for(Asset asset:assetList){
			if(asset.getBpmId()==null || asset.getBpmId()==""){
				assetList1.add(asset);
			}else{
				assetList2.add(asset);
			}
		}
		if(!assetList.isEmpty()){
		Map<String, Object> paramMap= new HashMap<>();
		HttpSession session=request.getSession();
		String userId=((User)session.getAttribute("user")).getUserId();
		String orgId=(String)session.getAttribute("orgId");
		paramMap.put("business", assetList2);
		paramMap.put("OrgIdMethodName", "orgId");		
		paramMap.put("userId",userId);	
		paramMap.put("filter",false);
		paramMap.put("flag",false);
		String paramString=JSONObject.fromObject(paramMap).toString();
		//1.调用bpm3流程的接口（测试）-查询任务
		String ob=RestUtils.executePost(flowUrlpath+"/jbpm/filterTasks",paramString);
		JSONArray jsonArray=JSONArray.fromObject(ob);   
		List<Asset> assets = (List<Asset>)JSONArray.toList(jsonArray, Asset.class);
		assetList1.addAll(assets);
		}
		
		return assetList1;
	}

	@ApiOperation(value = "提交审核", notes = "提交审核")
	@PostMapping(value = "/updatebyCid")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "cardNumber", value = "卡片编号", required = true, dataType = "String", paramType = "query"),
			@ApiImplicitParam(name = "auditState", value = "审核状态", required = false, dataType = "Integer", paramType = "form"),
			@ApiImplicitParam(name = "params", value = "审核要素", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "auditOpinion", value = "审核意见", required = false, dataType = "String", paramType = "form") })
	public int updatebyCid(@RequestParam String cardNumber, @RequestParam(required = false) Integer auditState,
			@RequestParam(required = false) String auditOpinion,String params,HttpServletRequest request,HttpServletResponse response) {
		
		if(cardNumber.contains("' ',")){
			cardNumber=cardNumber.substring(4,cardNumber.length());
		}
		String [] s=cardNumber.split(",");

		int r=0;
		for(int m=0;m<s.length;m++){
			String cardNumber1=s[m].substring(1,s[m].length()-1);
			System.out.println(cardNumber1);
		
		//获取session中的信息，给外部流程的方法需要的参数赋值
		Integer auditState1=0;
		if(auditState==6){
			auditState1=2;
		}else{
			auditState1=auditState-1;
		}
		HttpSession session=request.getSession();
	    User user=(User)session.getAttribute("user");
		String orgId=(String)session.getAttribute("orgId");
		String businessId=cardNumber1;
		AssetVo avo=AssetService.findAssetById(cardNumber1);
		Asset asset=avo.getAsset();
		String processInstanceId=null;
		String bpmId = asset.getBpmId();
		
		if(auditState1==1){
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
				variables.put("tenantCode", "204");
				variables.put("orgId",orgId);
				Map<String, Object> paramMap1=new HashMap<>();
				paramMap1.put("processDeploymentId", processDeploymentId);
				paramMap1.put("variables", variables);
				String paramString1=JSONObject.fromObject(paramMap1).toString();
				//2.调用bpm3流程的接口（测试）-获取流程实例id		
				processInstanceId=RestUtils.executePost(flowUrlpath+"jbpm/startProcessInstanceAndComplateFirstTask",paramString1);
				asset.setBpmId(processInstanceId);
				
				Map<String, Object> paramMap2=new HashMap<>();
				paramMap2.put("processInstanceId", processInstanceId);
				String paramString2=JSONObject.fromObject(paramMap2).toString();
				//3.调用bpm3流程的接口-判断实例的状态
				String b=RestUtils.executePost(flowUrlpath+"jbpm/isEnd",paramString2);
				if(auditState1==1){
					if(b.equalsIgnoreCase("true")){
						//流程结束
						//执行申请走完制单之后直接结束，这种情况待讨论
						asset.setAuditState(1);
					}else{
						//待审批需要走流程				
						asset.setAuditState(2);
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
				if(auditState1==1) asset.setAuditState(2);
			}
			// 提交
			AssetService.updateAsset1(asset);
			r=AssetService.updatebyCid(cardNumber, auditState, auditOpinion);
			
			//提交功能查询审核要素
			Map<String, Object> paramMap4=new HashMap<String, Object>();
			paramMap4.put("bpmId", asset.getBpmId());
			if(auditState1==1) paramMap4.put("state", "1");
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
			if(auditState1==1) paramMap5.put("source", "zc");
			paramMap5.put("creator", user.getName());
			paramMap5.put("creatorId",user.getUserId());
			paramMap5.put("auditLink","制单");
			paramMap5.put("auditElements",Element);
			AssetVo avo1=AssetService.findAssetById(cardNumber1);
			paramMap5.put("viewObject",avo1);
			String paramString5=JSONObject.fromObject(paramMap5).toString();
			//5.调用bpm3流程的接口-添加日志 		 
			String audit=RestUtils.executePost(flowUrlpath+"jbpm/addAuditLog",paramString5);
		}
		if(auditState1==2){
			
			Map<String,Object> paramsMap=(Map)JSONObject.fromObject(params);
			Map<String, Object> taskParams=new HashMap<>();
			//1.查询流程部署Id和流程节点名称
			Map<String, Object> paramMap01=new HashMap<String, Object>();
			paramMap01.put("bpmId", asset.getBpmId());
			String paramString01=JSONObject.fromObject(paramMap01).toString();
			//调用jbpm/findFlowsInfo(String bpmId) 方法
			String map = RestUtils.executePost(flowUrlpath+"jbpm/findFlowsInfo",paramString01);			
	        JSONObject jsonObject = JSONObject.fromObject(map);	         
	        Map<String, Object> map6 = JSONObject.fromObject(jsonObject);
	
			String auditLink=(String)map6.get("taskName");
			
			taskParams.put("bpmId", asset.getBpmId());
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
//			String outComeName = "通过";
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
					if(outComeName.equals("通过")){
						if(auditState1==2)asset.setAuditState(3);
						asset.setBpmId("");
						
					}else if(outComeName.equals("回退")){
						if(auditState1==2)asset.setAuditState(6);

					}
					
				}
			}
			
			AssetService.updateAsset1(asset);
			r=AssetService.updatebyCid(cardNumber, auditState, auditOpinion);
			//3.保存日志			
			if(auditState1==2) logParams.put("source", "zc");
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
			logParams.put("businessId", cardNumber1);
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
//		int i=AssetService.updatebyCid(cardNumber, auditState, auditOpinion);
		return r;
	}

	@ApiOperation(value = "数据字典", notes = "数据字典")
	@PostMapping(value = "/findByCode")
	@ApiImplicitParam(name = "code", value = "字典类型", dataType = "String", paramType = "query")
	public List<Dictionary> findByCode(@RequestParam(required = false) String code) {
		return AssetService.findByCode(code);
	}
	
	@ApiOperation(value = "数据字典", notes = "数据字典")
	@PostMapping(value = "/findByCodeUnit")
	@ApiImplicitParam(name = "code", value = "字典类型", dataType = "String", paramType = "query")
	public List<Dictionary> findByCodeUnit(@RequestParam(required = false) String code) {
		return AssetService.findByCodeUnit(code);
	}
	
	@ApiOperation(value = "资产大类字典", notes = "资产大类")
	@PostMapping(value = "/findByClassifyCode")
	@ApiImplicitParam(name = "code", value = "字典类型", dataType = "String", paramType = "query")
	public List<Classify> findByClassifyCode(@RequestParam(required = false) String code) {
		return AssetService.findByClassifyCode(code);
	}
	
	@ApiOperation(value = "资产台账", notes = "资产台账")
	@PostMapping(value = "/findAssetByTZ")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "group_id", value = "用户组id", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "user_id", value = "用户id", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "news_date_str", value = "增加开始时间", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "news_date_end", value = "增加结束时间", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "deal_date_str", value = "处置开始时间", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "deal_date_end", value = "处置结束时间", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "asset_first", value = "资产大类", required = false, dataType = "String", paramType = "form"),
			@ApiImplicitParam(name = "audit_state", value = "审核状态", required = false, dataType = "String", paramType = "form")})
	public List<Asset> findByBT(
			@RequestParam(required = false) String group_id,
			@RequestParam(required = false) String user_id, 
			@RequestParam(required = false) String news_date_str,
			@RequestParam(required = false) String news_date_end, 
			@RequestParam(required = false) String deal_date_str,
			@RequestParam(required = false) String deal_date_end,
			@RequestParam(required = false) String asset_first,
			@RequestParam(required = false) String audit_state) {
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
		if(news_date_str!=null){
			if(!news_date_str.equals("")){
				sql=sql+"and news_date>='"+news_date_str+"'";
			}
		}
		if(news_date_end!=null){
			if(!news_date_end.equals("")){
				sql=sql+"and news_date<='"+news_date_end+"'";
			}
		}
		if(deal_date_str!=null){
			if(!deal_date_str.equals("")){
				sql=sql+"and deal_date>='"+deal_date_str+"'";
			}
		}
		if(deal_date_end!=null){
			if(!deal_date_end.equals("")){
				sql=sql+"and deal_date<='"+deal_date_end+"'";
			}
		}
		if(asset_first!=null){
			if(!asset_first.equals("")){
				sql=sql+"and asset_first='"+asset_first+"'";
			}
		}
		if(audit_state!=null){
			if(!audit_state.equals("")){
				sql=sql+"and audit_state in("+audit_state+")";
			}
		}

		return AssetService.findByTZ(sql);

	}

}
