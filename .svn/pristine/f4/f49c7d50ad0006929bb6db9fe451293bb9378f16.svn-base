package com.bpm.asset.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Value;

public class test2 {

	@Value("${spring.fileUpload.address}")
	private String filePath;

	public static void main(String[] args) throws IOException {

		String htmlurl = "C:/work/123/2.txt";
		String urlpath = "C:/work/123/";
		String uuid = "d378";

		// 获取上传地址
		File infile = new File(htmlurl);
		// file.mkdir(); 创建次资产卡片的编号命名的文件夹,如果有就忽略，没有创建
		new File(urlpath + uuid).mkdir();
		// 输出文件到服务器文件夹
		String name = htmlurl.substring(htmlurl.lastIndexOf('/') + 1, htmlurl.length());
		System.out.println(name);
		File outfile = new File(urlpath + uuid + "/" + name);

		// 使用装饰模式，把fis装饰进去bis中。使用缓冲读取速度变快
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(infile));

		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(outfile));

		int b;
		while ((b = bis.read()) != -1) {
			bos.write(b);
		}
		bis.close();
		bos.close();

		File file = new File("C:/work/123/d378");// 指定文件路径
		
		System.out.println(file.exists());
		File[] f = file.listFiles();// 获取指定目录下的所有文件或者文件夹的File数组
		for (File fi : f) {// 加强for循环遍历输出
			System.out.println(fi);
		}
		// 删除文件或者文件夹，文件夹下有文件不能删除
		 file.delete();
		System.out.println(file.list().length);
		

		System.out.println("运行结束");
	}

}
