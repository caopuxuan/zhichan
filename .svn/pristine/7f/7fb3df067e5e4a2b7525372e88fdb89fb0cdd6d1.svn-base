package com.bpm.asset.service.impl;

import java.io.File;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.bpm.asset.service.FileService;

@Service
public class FileServiceImpl implements FileService {

	@Value("${spring.fileUpload.address}")
	private String filePath;

	// 删除文件-单个
	public void deleteFile(String url, String number) {

		String name = url.substring(url.lastIndexOf('/') + 1, url.length());
		// 获取指定文件
		File file = new File(filePath + number + '/' + name);// 指定文件路径
		// 获取指定文件夹
		File files = new File(filePath + number);// 指定文件路径
		// 如果文件存在 就删除一个
		if (file.exists()) {
			file.delete();
			// 如果文件夹下没有文件了就删除整个文件夹
			if (files.list().length == 0) {
				files.delete();
			}
		}
	};

	// 删除文件-多个
	public void deleteFile(String number) {
		// 获取指定文件夹
		File files = new File(filePath + number);// 指定文件路径
		if (files.exists()) {
			// 存在多个就删除整个文件夹
			File[] f = files.listFiles();// 获取指定目录下的所有文件或者文件夹的File数组
			for (File fi : f) {// 加强for循环遍历输出
				fi.delete();
			}
			// 如果文件夹下没有文件了就删除整个文件夹
			if (files.list().length == 0) {
				files.delete();
			}
		}
	};
}
