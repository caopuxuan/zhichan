package com.bpm.asset.controller;
import com.bpm.asset.service.AssetService;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bpm.asset.vo.AssetVo;
import com.atools.config.power.model.User;
import com.bpm.asset.entity.Asset;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import net.sf.json.JSONArray;
import nl.bitwalker.useragentutils.Browser;
import nl.bitwalker.useragentutils.UserAgent;


@RestController 
@Api(value = "资产Excel导入导出")
public class AssetPOIController {
	 @Resource
	 private AssetService AssetService;
	 private Logger logger = LogManager.getLogger(this.getClass()); 
	
//	 @ApiOperation(value = "资产导出", notes = "资产导出")
//	 @PostMapping(value = "/assetExport1")
//	 @ApiImplicitParam(name = "cid", value = "卡片编号")
//	 public String assetExport(@RequestBody String cid,HttpServletRequest request){		 
//		 List<Asset> assetList=new ArrayList<>();
//		 Asset asset=AssetService.findAssetById(cid).getAsset();
//		 assetList.add(asset);		 		
//		 
//		 Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams(), Asset.class, assetList);
//		 FileOutputStream fos;
//		try {
//			fos = new FileOutputStream("资产.xls");
//			workbook.write(fos);
//	        fos.close();
//		} catch (Exception e) {
//			System.out.println(e.toString());
//		}
//		return "数量="+assetList.size();
//	}
	 @ApiOperation(value = "资产导出", notes = "资产导出")
	 @PostMapping(value = "/assetExport")
//	 @ApiImplicitParam(name = "cids", value = "卡片编号", dataType = "List<String>")	 
	 @ApiImplicitParam(name = "cids", value = "卡片编号", dataType = "String")	 
//	 public void assetExport(@RequestParam (required = false, value = "cids[]") List<String> cids,HttpServletRequest request, HttpServletResponse response){
	 public void assetExport(@RequestParam (required = false, value = "cids") String cids,HttpServletRequest request, HttpServletResponse response){
		   
		    UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));   
		    Browser browser = userAgent.getBrowser();    
		    String browserName=browser.getName();
		    String fileName="资产.xls";
			try {
				if(browserName.equals("Firefox")) {
					fileName =new String(fileName.getBytes("GB2312"),"ISO-8859-1"); 
				}else {
					fileName =URLEncoder.encode(fileName, "UTF-8");
				}
			} catch (UnsupportedEncodingException e1) {
				 logger.info(e1.toString());
			}
			response.setContentType("application/x-msdownload");
		    response.setContentType("application/octet-stream");
		    response.setContentType("application/vnd.ms-excel");
		    response.setHeader("Content-Disposition", "attachment;filename=" + fileName); 
		   List<Asset> assetList=new ArrayList<>();
		   String[] cidArray=cids.split(",");
		   for(String cid:cidArray){
			 Asset asset=AssetService.findAssetById(cid).getAsset();
			 assetList.add(asset);
		   }
		   System.out.println(assetList.size());
		   Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams(), Asset.class, assetList);
		   FileOutputStream fos;
			try {
				workbook.write(response.getOutputStream());		        
			} catch (Exception e) {
				System.out.println(e.toString());
			}
	}
	 
	 @ApiOperation(value = "资产导入", notes = "资产导入")
	 @PostMapping(value = "/assetImport")
	 public Integer assetImport(HttpServletRequest request,HttpServletResponse response) throws FileNotFoundException, Exception{
		 List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("Fdata");
		 List<Asset> list=new ArrayList<>();
		 MultipartFile file=files.get(0);
		 // 获取上传文件的路径
	  	 String filePath = file.getOriginalFilename();
	  	 // 截取上传文件的文件名 ie会带有全路径
	  	 String fileName = filePath.substring(filePath.lastIndexOf('\\') + 1, filePath.indexOf('.'));
	  	System.out.println("multiReq.getFile():" + fileName);
		 ImportParams params = new ImportParams();
	     params.setHeadRows(1);
	     List<Asset> list0 = ExcelImportUtil.importExcel(file.getInputStream(), Asset.class, params);
	     list.addAll(list0);
		 
		 int j=0;
		 //获取session中的信息，初始化
		 HttpSession session=request.getSession();
		 String userId=(String)session.getAttribute("userId");
		 User user=(User)session.getAttribute("user");
		 String username=user.getName();
		 String tenantCode=(String)session.getAttribute("tenantCode");
		 String orgId=(String)session.getAttribute("orgId");
		 int assetClassify=0;
		 if(fileName.equalsIgnoreCase("土地")) assetClassify=1;
		 if(fileName.equalsIgnoreCase("房屋")) assetClassify=2;
		 if(fileName.equalsIgnoreCase("构筑物")) assetClassify=3;
		 if(fileName.equalsIgnoreCase("通用设备")) assetClassify=4;
		 if(fileName.contains("通用设备")) assetClassify=4;
		 if(fileName.equalsIgnoreCase("车辆")) assetClassify=5;
		 if(fileName.equalsIgnoreCase("专用设备")) assetClassify=6;
		 if(fileName.equalsIgnoreCase("文物和陈列品")) assetClassify=7;
		 if(fileName.equalsIgnoreCase("图书、档案")) assetClassify=8;
		 if(fileName.equalsIgnoreCase("家具、用具、装具")) assetClassify=9;
		 if(fileName.equalsIgnoreCase("特种动植物")) assetClassify=10;
		 
		 for(Asset asset:list){
			 AssetVo avo=new AssetVo();
//			 asset.setCardNumber(cardNumber);
			 asset.setUserId(userId);
			 asset.setUserName(username);
			 asset.setTenantCode(tenantCode);
			 asset.setOrgId(orgId);
			 asset.setAssetFirst(assetClassify);
			 avo.setAsset(asset);
			 int i=AssetService.addAsset(avo);
			 j=j+i;
		 }
		 return j;
	 }
}
