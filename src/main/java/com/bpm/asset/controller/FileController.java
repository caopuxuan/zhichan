package com.bpm.asset.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bpm.asset.service.FileService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import nl.bitwalker.useragentutils.Browser;
import nl.bitwalker.useragentutils.UserAgent;

@RestController
@Api(value = "文件上传下载")
public class FileController {
	@Value("${spring.fileUpload.address}")
	private String filePath;

	@Resource
	private FileService FileService;

	private static final Logger logger = LoggerFactory.getLogger(FileController.class);

	// 文件上传相关代码
	@ApiOperation(value = "文件上传", notes = "文件上传")
	@PostMapping(value = "/upload")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "number", value = "卡片编号（文件夹名字）", required = false, dataType = "String", paramType = "form") })
	public String UploadFile(String number,HttpServletRequest request,HttpServletResponse response) {
		
		List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("upload");
	    MultipartFile file = null;
	    
		BufferedInputStream bis =null;
		BufferedOutputStream bos = null;
		
		 for (int i = 0; i < files.size(); i++) {
		      file = files.get(i);
		      if (!file.isEmpty()) {
		    	// 获取上传文件的路径
		  		String uploadFilePath = file.getOriginalFilename();
		  		// 截取上传文件的文件名 ie会带有全路径
		  		String uploadFileName = uploadFilePath.substring(uploadFilePath.lastIndexOf('\\') + 1, uploadFilePath.length());
		  		// file.mkdir(); 创建次资产卡片的编号命名的文件夹,如果有就忽略，没有创建
		  		new File(filePath + number).mkdir();
		  		//文件输出位置 比编号为
		  		File outfile = new File(filePath + number + "/" + uploadFileName);
		    	  
		try {
			bis = new BufferedInputStream((FileInputStream) file.getInputStream());
			bos = new BufferedOutputStream(new FileOutputStream(outfile));
			int b;
			while ((b = bis.read()) != -1) {
				bos.write(b);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (bis != null) {
				try {
					bis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (bos != null) {
				try {
					bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		      }
		      }
		 System.out.println("上传完成");
		 
		 return "ok!";
	}

	// 文件下载相关代码
	@ApiOperation(value = "文件下载", notes = "文件下载")
	@PostMapping(value = "/download")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "number", value = "卡片编号（文件夹名字）", required = false, dataType = "String", paramType = "form"),
		@ApiImplicitParam(name = "fileName", value = "文件名", required = false, dataType = "String", paramType = "form")})
	
	public void downloadFile(String number, String fileName, HttpServletResponse res, HttpServletRequest request) {
		fileName = "jBPM4.4文档.doc";
		number = "f23-12312";

		UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
		Browser browser = userAgent.getBrowser();
		String browserName = browser.getName();
		String newfileName = fileName;
		try {
			if (browserName.equals("Firefox")) {
				newfileName = new String(fileName.getBytes("GB2312"), "ISO-8859-1");
			} else {
				newfileName = URLEncoder.encode(fileName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e1) {
			logger.info(e1.toString());
		}
		res.setContentType("application/x-msdownload");
		res.setContentType("application/octet-stream");
		res.setHeader("Content-Disposition", "attachment;filename=" + newfileName);
		res.setHeader("content-type", "application/octet-stream");

		BufferedInputStream bis = null;
		OutputStream os = null;
		try {
			os = res.getOutputStream();
			bis = new BufferedInputStream(new FileInputStream(new File(filePath + number + "/" + fileName)));
			int i;
			while ((i = bis.read()) != -1) {
				os.write(i);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (bis != null) {
				try {
					bis.close();
				} catch (IOException e) {
					logger.info(e.toString());
				}
			}
		}
	}
	// //多文件上传
	// @ApiOperation(value="多文件上传", notes="多文件上传")
	// @PostMapping(value = "/batch/upload")
	// @ResponseBody
	// public void handleFileUpload(HttpServletRequest request) {
	// List<MultipartFile> files = ((MultipartHttpServletRequest)
	// request).getFiles("file");
	// MultipartFile file = null;
	// BufferedOutputStream stream = null;
	// for (int i = 0; i < files.size(); ++i) {
	// file = files.get(i);
	// if (!file.isEmpty()) {
	// try {
	// String uploadFilePath = file.getOriginalFilename();
	// System.out.println("uploadFlePath:" + uploadFilePath);
	// // 截取上传文件的文件名
	// String uploadFileName =
	// uploadFilePath.substring(uploadFilePath.lastIndexOf('\\') +
	// 1,uploadFilePath.indexOf('.'));
	// System.out.println("multiReq.getFile()" + uploadFileName);
	// // 截取上传文件的后缀
	// String uploadFileSuffix =
	// uploadFilePath.substring(uploadFilePath.indexOf('.') + 1,
	// uploadFilePath.length());
	// System.out.println("uploadFileSuffix:" + uploadFileSuffix);
	// stream = new BufferedOutputStream(new FileOutputStream(new File(filePath
	// + uploadFileName + "." + uploadFileSuffix)));
	// byte[] bytes = file.getBytes();
	// stream.write(bytes,0,bytes.length);
	// } catch (Exception e) {
	// e.printStackTrace();
	// } finally {
	// try {
	// if (stream != null) {
	// stream.close();
	// }
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// }
	// } else {
	// System.out.println("上传文件为空");
	// }
	// }
	// System.out.println("文件上传成功了");
	// }

	// 文件删除-单个
	@ApiOperation(value = "文件删除-单个", notes = "文件删除-单个")
	@PostMapping(value = "/delete")
	public void deleteFile(String url, String number) {
		FileService.deleteFile(url, number);
	}

	// 文件删除-批量
	@ApiOperation(value = "文件删除-批量", notes = "文件删除-批量")
	@PostMapping(value = "/deletes")
	public void deleteFile(String number) {
		FileService.deleteFile(number);
	}

}