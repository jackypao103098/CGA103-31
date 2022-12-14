<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <script src="js/jquery.min.js" type="text/javascript"></script>

  <!-- Bootstrap CSS -->
  <link href="css/style.css" type="text/css" rel="stylesheet" />
  <link href="css/bootstrap-datepicker.css" type="text/css" rel="stylesheet" />
  <link href="fontawesome-free-6.1.2-web/css/all.css" rel="stylesheet">
  <!-- Favicon -->
  <!-- Favicon and Touch Icons -->
  <link href="/CGA103G1/frontend/assets/imgs/logo.png" rel="shortcut icon" type="image/png" />
  <link href="/CGA103G1/frontend/assets/imgs/logo.png" rel="apple-touch-icon" />
  <link href="/CGA103G1/frontend/assets/imgs/logo.png" rel="apple-touch-icon" sizes="72x72" />
  <link href="/CGA103G1/frontend/assets/imgs/logo.png" rel="apple-touch-icon" sizes="114x114" />
  <link href="/CGA103G1/frontend/assets/imgs/logo.png" rel="apple-touch-icon" sizes="144x144" />
  <title>揪團活動明細頁</title>
</head>

<body>

  <header class="header-static navbar-sticky navbar-light shadow">

  </header>


  <div id="actBanner">

  </div>

  <section class="pt80 pb80 listingDetails Campaigns">
    <div class="container">
      <div class="row">
        <!-- 左邊主內容 -->
        <div class="col-lg-9 col-md-12 col-sm-12" id="detailAct" >
          
        </div>

        <!-- 右邊 sidebar -->
        <div class="col-lg-3 col-md-12 col-sm-12 right_Details text-center">
          <div class="p-4 shadow ml-lg-4 rounded sticky-top" style="top: 100px">
            <a class="btn btn-danger text-center" id="reportBtn">
              檢舉活動
            </a>
            <hr class="my-3" />
            <a class="btn btn-success text-center" id="joinBtn">
              確定加入
            </a>
          </div>
        </div>

      </div>
    </div>
  </section>


  <!--  footer  -->
  <footer class="footer footer-dark pt-6 position-relative">

  </footer>
  <!-- footer  -->

  <script src="/CGA103G1/frontend/act/ownJS/actDetailJoin.js" type="text/javascript"></script>
  <script src="/CGA103G1/frontend/act/ownJS/includeFooterHeader.js" type="text/javascript"></script>
  <script src="/CGA103G1/frontend/act/ownJS/includeActBanner.js" type="text/javascript"></script>
  <script src="/CGA103G1/frontend/act/ownJS/getOneActDetailPage.js" type="text/javascript"></script>


  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="js/popper.min.js" type="text/javascript"></script>
  <script src="js/bootstrap.min.js" type="text/javascript"></script>
  <script src="js/functions.js" type="text/javascript"></script>
  <script src="js/owl.carousel.min.js" type="text/javascript"></script>
  <script src="js/slick.js" type="text/javascript"></script>
  <script src="js/swiper.min.js" type="text/javascript"></script>
  <script src="js/main.js" type="text/javascript"></script>
  <script src="js/jquery.fancybox.min.js" type="text/javascript"></script>
  <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
  <script src="js/jquery-ui.min.js" type="text/javascript"></script>
  <script src="js/isotope.pkgd.min.js" type="text/javascript"></script>
  <script src="js/imagesloaded.pkgd.min.js" type="text/javascript"></script>
  <script src="js/markerclusterer.js"></script>
</body>

</html>