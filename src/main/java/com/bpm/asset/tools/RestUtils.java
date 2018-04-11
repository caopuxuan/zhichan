/**
 * 
 */
package com.bpm.asset.tools;

import javax.ws.rs.core.MultivaluedMap;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;


/**
 * @author zhiwei.chen
 * @time 上午10:38:03
 */
public final class RestUtils {

	//日志工具
	private static Logger logger = LogManager.getLogger(RestUtils.class);
	
	//请求方法常量
	public static final String POST = "POST";
	public static final String DELETE = "DELETE";
	public static final String PUT = "PUT";
	public static final String GET = "GET";
	
	private static Client client = Client.create();
	static {
		client.setReadTimeout(30000);// 30s
		client.setConnectTimeout(30000);
	}
	
	
	public static  String executePost(String httpUrl, String param){
		logger.info("url："+httpUrl+",param:"+param);
		WebResource webResource = client.resource(httpUrl);
		MultivaluedMap<String, String> paramMap= new MultivaluedMapImpl();
		paramMap.add("params", param);
		ClientResponse response = webResource.post(ClientResponse.class, paramMap);		
		logger.info("请求返回：" + response.getStatus());
		if (response.getStatus() != 200) {
			return response.getStatus()+"";
		}
		return response.getEntity(String.class);
	}
	
	public static String executePut(String httpUrl, String param){
		WebResource webResource = client.resource(httpUrl);		
		ClientResponse response = webResource
			.header("Content-type", "application/json")
			.accept("application/json")
			.put(ClientResponse.class, param);
		logger.info("请求返回：" + response.getStatus());
		if (response.getStatus() != 200 && response.getStatus() != 204) {
			return response.getStatus()+"";
		}
		return response.getEntity(String.class);
	}
	
	public static String executeGet(String httpUrl){
		WebResource webResource = client.resource(httpUrl);		
		ClientResponse response = webResource
			.accept("application/json")
			.get(ClientResponse.class);
		logger.info("请求URL:"+httpUrl+",返回：" + response.getStatus());
		if (response.getStatus() != 200) {
			return response.getStatus()+"";
		}
		String result = response.getEntity(String.class);
		return result;
	}
	
	public static String executeDelete(String httpUrl){
		WebResource webResource = client.resource(httpUrl);		
		ClientResponse response = webResource
			.accept("application/json")
			.delete(ClientResponse.class);
		logger.info("请求返回：" + response.getStatus());
		/*if (response.getStatus() != 200) {
			return MessageConvert.getMessage(response.getStatus());
		}*/
		return response.getEntity(String.class);
	}
	
	
	public static void main(String[] args)throws Exception {
		String httpUrl = "http://211.150.68.183/AUTH/rest/api/user/userLogin/zhiwei.chen1@net263.com/111111;productId=5";
		String str = executeGet(httpUrl);
		System.out.println(str);
	}
	
	
}
