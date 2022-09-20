package com.act.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mysql.cj.Session;

@WebServlet("/redirectDetailPage")
public class RedirectDetailPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html; charset=UTF-8");
        System.out.println("actSearchListPage <a> Request -> RedirectDetailPageServlet");
        
		String action = req.getParameter("action");
		
		Integer actNo = Integer.parseInt(req.getParameter("actNo"));
		System.out.println("RedirectDetailPageServlet : " + actNo);	
		HttpSession actSession = req.getSession();	
		actSession.setAttribute("actNo", actNo);
		
		if ("actInner".equals(action)) {
        	try {
//        		req.setAttribute("actNo", Integer.parseInt(req.getParameter("actNo")));
//        		req.getRequestDispatcher("/frontend/act/actDetailJoinPage.html")
//        		.forward(req, res);
        		res.sendRedirect("/CGA103G1/frontend/act/actDetailJoinPage.html");
				return;
			} catch (Exception e) {
//				req.getRequestDispatcher("/frontend/act/actSearchListPage.html")
//        		.forward(req, res);
				res.sendRedirect("/CGA103G1/frontend/act/actSearchListPage.html");
				return;
			}
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
	}

}
