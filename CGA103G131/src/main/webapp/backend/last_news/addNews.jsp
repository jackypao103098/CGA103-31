<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.last_news.model.*"%>
<%@ page import="java.time.LocalDate"%>
<jsp:useBean id="lastNewsSvc"
	class="com.last_news.model.LastNewsService" />

<%
LastNewsVO lastNewsVO = (LastNewsVO) request.getAttribute("lastNewsVO");
%>

<html>
<head>
<%@ include file="/backend/commonCSS.file"%>
</head>

<body>
	<%@ include file="/backend/loading.file"%>
	<!-- loading -->
	<%@ include file="/backend/header.file"%>
	<!-- Header -->
	<%@ include file="/backend/sidebar.file"%>
	<!-- sidebar -->


	<div class="main-content">
		<hr>
		<br> <br>
		<h3>新增最新消息</h3>
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<form METHOD="post" ACTION="<%=request.getContextPath()%>/lastNews"	enctype="multipart/form-data">
			<table>
				<thead>
					<tr>

						<th>文字</th>
						<th>圖片</th>
						<th>#</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><textarea name="news" rows="3"></textarea></td>
						<td><input type="file" name="news_img"	 accept="image/*" /></td>
						<td><input type="hidden" name="action" value="insert" /></td>
						<td><input type="submit" value="送出新增" /></td>

					</tr>
				</tbody>
			</table>
		</form>


	</div>


	<%@ include file="/backend/commonJS.file"%>
	<!-- 基本JS檔案 -->
	<script>
		// 			● 可在這更改這一頁header的標題，不寫也可以，但請變成空字串 
		$("#pagename").text("MEMORY 後台管理");
	</script>
</body>
</html>