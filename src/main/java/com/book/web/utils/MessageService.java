package com.book.web.utils;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;

import net.nurigo.sdk.message.model.Message;



public class MessageService {
	
	public void sendMessage(HttpServletRequest request, String randomNumber) {
		String api_key = "발급 받았던 apikey";
		String api_secret = "api secret 번호";
		
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String,String>();
		String mTel = request.getParameter("mTel"); //수신 전화번호 (JSP를 통해 받음)
		params.put("to", mTel); // 수신전화번호 (직접 입력해도된다. String 형태)
		params.put("from", "발신 전화번호");
		params.put("type", "SMS"); // 문자 타입
		params.put("text", "[Ka Ac Tueail] 본인확인 인증번호 (" + randomNumber + ") 를 입력하세요."); // 입력할 내용
		params.put("app_version", "JAVA SDK v2.2");
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
	}
	
}
