<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coup.model.*"%>
<%@ page import="com.mem.model.*"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>會員登入</title>
<%-- CSS --%>
	<%@ include file="/frontend/commonCSS.file" %>
</head>

<body>

  <!-- =======================
<%-- header --%>
  <%@ include file="/frontend/header.file" %>
 
  <!-- =======================
	header End-->
  <section class="login-area">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="login-box">
            <div class="login-top">
              <h1><b>歡迎回來</b></h1>

            </div>
            <form class="login-form" action="loginhandler"method="post">
              <div class="row">
                <div class="col-md-12 email">
                  <label>信箱</label>
                  <input type="text" name="mem_email" placeholder="Enter your email here" value="hello@example.com">
                </div>
                <div class="col-md-12 password">
                  <label>密碼</label>
                  <input type="password" name="mem_pwd" placeholder="Enter password" value="Password">
                </div>

                  <div class="forget-btn">
                    <a href="forgetPassword.jsp">忘記密碼?</a>
                  </div>
                  <div class="forget-btn">
                    <a href="addMem.jsp">註冊帳號</a>
                  </div>
                </div>
                <div class="col-md-12">
                  <button type="submit" name="button">登入</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  </div> <!-- 這兩個 div 會影響 footer 不可刪 -->
  </div> <!-- 這兩個 div  footer 不可刪 -->

  <!-- 主內容 end -->

  <%-- footer --%>
	<%@ include file="/frontend/footer.file" %>
  	
  	<%-- commonJS --%>
	<%@ include file="/frontend/commonJS.file" %>

</body>

</html>