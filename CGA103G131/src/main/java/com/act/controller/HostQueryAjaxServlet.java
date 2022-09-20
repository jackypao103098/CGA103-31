package com.act.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.act.model.ActService;
import com.act.model.ActVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.util.LocalDateTimeDeserializer;
import com.util.LocalDateTimeSerializer;
import com.act.model.*;

@WebServlet("/hostQueryAjax")
public class HostQueryAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("jQueryAjax Request 過來了");
		// 解決 post 中文亂碼問題
         req.setCharacterEncoding("UTF-8");
        // 解決 response 中文亂碼問題
         res.setContentType("text/html; charset=UTF-8");
        
        ActService actService = new ActService();
		List<ActVO> actList = actService.getAll();		
        GsonBuilder gsonBuilder = new GsonBuilder();  
        gsonBuilder.registerTypeAdapter(LocalDateTime.class, new LocalDateTimeSerializer());      
        gsonBuilder.registerTypeAdapter(LocalDateTime.class, new LocalDateTimeDeserializer());
		// Java物件 轉成 JSON 字串
		Gson gson = gsonBuilder.setPrettyPrinting().create();
		String personJsonString = gson.toJson(actList);
		res.getWriter().write(personJsonString);
	}

//    protected void jQuerySerialize(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//    	System.out.println("jQuerySerialize Request 過來了");
//		
//    	System.out.println("帳號： " + req.getParameter("username"));
//    	System.out.println("密碼： " + req.getParameter("password"));
//    	System.out.println("選單： " + req.getParameter("single"));
//    	System.out.println("多選擇： " + req.getParameter("multiple"));
//    	System.out.println("複選： " + req.getParameter("check"));
//    	System.out.println("單選： " + req.getParameter("radio"));
//
//		// Java物件 轉成 JSON 字串
////		Gson gson = new Gson();	
////		String personJsonString = gson.toJson();		
////		res.getWriter().write(personJsonString);
//    }

}
