<%@ page language="java" contentType = "text/html; charset=euc-kr"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="products.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>헛개 주문하기</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .pt-100 {
                padding-top: 100px;
            }
            .pb-70 {
                padding-bottom: 70px;
            }
            .section-header {
                margin-bottom: 60px;
                text-align: center;
            }
            .section-header i {
                color: #ff007d;
                font-size: 50px;
                display: inline-block;
                margin-bottom: 10px;
            }
            .section-header h2 {
                font-weight: bold;
                font-size: 34px;
                margin: 0;
            }
            .section-header p {
                max-width: 500px;
                margin: 20px auto 0;
            }
            .single-publication {
                border: 1px solid #f2eee2;
                margin-bottom: 30px;
                position: relative;
                overflow: hidden;
            }
            .single-publication figure {
                position: relative;
                margin: 0;
                text-align: center;
            }
            .single-publication figure > a {
                background-color: #fafafa;
                display: block;
            }
            .single-publication figure ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
                position: absolute;
                right: -50px;
                top: 20px;
                transition: .6s;
                -webkit-transition: .6s;
            }
            .single-publication:hover figure ul {
                right: 15px;
            }
            .single-publication figure ul li a {
                display: inline-block;
                width: 35px;
                height: 35px;
                text-align: center;
                font-size: 15px;
                background: #ff007d;
                margin-bottom: 7px;
                border-radius: 50%;
                line-height: 35px;
                color: #fff;
            }
            .single-publication figure ul li a:hover {
                color: #fff;
                background: #e50663;
            }
            .single-publication .publication-content {
                text-align: center;
                padding: 20px;
            }
            .single-publication .publication-content .category {
                display: inline-block;
                font-family: 'Open Sans', sans-serif;
                font-size: 14px;
                color: #ff007d;
                font-weight: 600;
            }
            .single-publication .publication-content h3 {
                font-weight: 600;
                margin: 8px 0 10px;
                font-size: 20px;
            }
            .single-publication .publication-content h3 a {
                color: #1f2d30;
            }
            .single-publication .publication-content h3 a:hover {
                color: #ff007d;
            }
            .single-publication .publication-content ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
                margin-bottom: 15px;
            }
            .single-publication .publication-content ul li {
                display: inline-block;
                font-size: 18px;
                color: #fec42d;
            }
            .single-publication .publication-content .price {
                font-size: 18px;
                color: #ff007d;
            }
            .single-publication .publication-content .price span {
                color: #6f6f6f;
                text-decoration: line-through;
                padding-left: 5px;
                font-weight: 300;
            }
            .single-publication .add-to-cart {
                position: absolute;
                right: 0;
                bottom: 0;
                left: 0;
                background: #fff;
                opacity: 0;
                visibility: hidden;
                text-align: center;
                -webkit-transform: scale(.7);
                transform: scale(.7);
                height: 105px;
                -moz-transition: .4s;
                -webkit-transition: .4s;
                transition: .4s;
            }
            .single-publication:hover .add-to-cart {
                visibility: visible;
                transform: scale(1);
                -webkit-transform: scale(1);
                opacity: 1;
            }
            .single-publication .add-to-cart .default-btn {
                margin-top: 28px;
                padding: 8px 25px;
                font-size: 14px;
            }
            .single-publication .category {
                margin: 0;
            }
            .single-publication .add-to-cart .default-btn {
                margin-top: 28px;
                padding: 8px 25px;
                font-size: 14px;
            }
            .default-btn {
                background-color: #ff007d;
                color: #fff;
                border: 1px solid #ff007d;
                display: inline-block;
                padding: 10px 30px;
                border-radius: 30px;
                text-transform: uppercase;
                font-weight: 600;
                font-family: 'Open Sans', sans-serif;
            }
            a:hover {
                color: #fff;
                text-decoration: none;
            }
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	 <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

	<script type="text/javascript">
	$(document).ready(function(){  
		

	    //각 product id는 value 값을 url로 전달
	    $("button[name=add1]").click(function () {

            $("form[name=shop]")

            .attr({ action: "shopPro.jsp?value="+$(this).val()+$("input[name=stock1]").val(), method: "post" })

            .submit();

        });
	    
	    $("button[name=add2]").click(function () {

            $("form[name=shop]")

            .attr({ action: "shopPro.jsp?value="+$(this).val()+$("input[name=stock2]").val(), method: "post" })

            .submit();

        });
	    
	    $("button[name=add3]").click(function () {

            $("form[name=shop]")

            .attr({ action: "shopPro.jsp?value="+$(this).val()+$("input[name=stock3]").val(), method: "post" })

            .submit();

        });
	    
	    $("button[name=add4]").click(function () {

            $("form[name=shop]")

            .attr({ action: "shopPro.jsp?value="+$(this).val()+$("input[name=stock4]").val(), method: "post" })

            .submit();

        });



	  
	});  
	</script>
	</head>
<body>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="product" class="products.ProductVO">
	<jsp:setProperty name="product" property="*"/>
</jsp:useBean>
<% 
	ProductBean PRODUCT = ProductBean.getInstance();
	ProductVO productvo1 = PRODUCT.productEdit(1);
	ProductVO productvo2 = PRODUCT.productEdit(2);
	ProductVO productvo3 = PRODUCT.productEdit(3);
	ProductVO productvo4 = PRODUCT.productEdit(4);
%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">               
<section class="our-publication pt-100 pb-70">
            <div class="container">
                <form id="shop" name="shop" class="form-horizontal" action="/product/shopPro.jsp" method="post" >
            
                <div class="section-header">
                    <i class="fa fa-book"></i>
                    <h2>Our 헛개s</h2>
                    <p>world's best 헛개 you can find</p>
                </div>
                
                <div class="add-to-cart">
                      <a href="/product/shoppingcart.jsp" class="default-btn">장바구니 페이지로 이동하기</a>
                </div>
                
                <br></br>
                
                <div class="row">
                    <div class="col-sm-6 col-lg-3"> 
                        <div class="single-publication">
                            <figure>
                                <a href="#">
                                    <img src="https://envytheme.com/tf-demo/edusplash/assets/img/publication/1.jpg" alt="Publication Image">
                                </a>
                                
							<div class="add-to-cart">
                                <button class="default-btn" name="add1" id="add1" value="1" >Add to Cart</button>
                            </div>


                            </figure>

                            <div class="publication-content">
                                <span class="category">헛개</span>
                                <h3><a href="#" name="1"><%= productvo1.getProduct_name() %></a></h3>
                                <ul>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                </ul>
                                	
                                <span class="category">수량: </span> <input  name="stock1" value=
                                "<%= productvo1.getProduct_stock() %>" type="text" style="width:50px;"> 개
                                <h4 class="price"> <%= productvo1.getProduct_price() %> 원 <span>9억</span></h4>
                            </div>

                        </div>
                    </div>
                    
                    
                    <div class="col-sm-6 col-lg-3"> 
                        <div class="single-publication">
                            <figure>
                                <a href="#">
                                    <img src="https://envytheme.com/tf-demo/edusplash/assets/img/publication/2.jpg" alt="Publication Image">
                                </a>
                                
							<div class="add-to-cart">
                                <button class="default-btn" name="add2" id="add2" value="2" >Add to Cart</button>
                            </div>                                

                            </figure>

                            <div class="publication-content">
                                <span class="category">헛개</span>
                                <h3><a href="#" name="2"><%= productvo2.getProduct_name() %></a></h3>
                                <ul>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                </ul>
                                <span class="category">수량: </span> <input  name="stock2" value=
                                "<%= productvo2.getProduct_stock() %>" type="text" style="width:50px;"> 개
                                <h4 class="price"> <%= productvo2.getProduct_price() %> 원 <span>9억</span></h4>
                            </div>

                        </div>
                    </div>
                    
                    <div class="col-sm-6 col-lg-3"> 
                        <div class="single-publication">
                            <figure>
                                <a href="#"><img src="https://envytheme.com/tf-demo/edusplash/assets/img/publication/3.jpg" alt="Publication Image"></a>

							<div class="add-to-cart">
                                <button class="default-btn" name="add3" id="add3" value="3" >Add to Cart</button>
                            </div>
                            
                            </figure>

                            <div class="publication-content">
                                <span class="category">헛개</span>
                                <h3><a href="#" name="3"><%= productvo3.getProduct_name() %></a></h3>
                                <ul>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                </ul>
                                <span class="category">수량: </span> <input  name="stock3" value=
                                "<%= productvo3.getProduct_stock() %>" type="text" style="width:50px;"> 개
                                <h4 class="price"> <%= productvo3.getProduct_price() %> 원 <span>9억</span></h4>
                            </div>

                
                        </div>
                    </div>
                    
                    <div class="col-sm-6 col-lg-3"> 
                        <div class="single-publication">
                            <figure>
                                <a href="#"><img src="https://envytheme.com/tf-demo/edusplash/assets/img/publication/4.jpg" alt="Publication Image"></a>

							<div class="add-to-cart">
                                <button class="default-btn" name="add4" id="add4" value="4" >Add to Cart</button>
                            </div>
                            
                            </figure>

                            <div class="publication-content">
                                <span class="category">헛개</span>
                                <h3><a href="#" name="4"><%= productvo4.getProduct_name() %></a></h3>
                                <ul>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                </ul>
                                <span class="category">수량: </span> <input  name="stock4" value=
                                "<%= productvo4.getProduct_stock() %>" type="text" style="width:50px;"> 개
                                <h4 class="price"> <%= productvo4.getProduct_price() %> 원 <span>9억</span></h4>
                            </div>

                        </div>
                    </div>
                </div>
                </form>
            </div>
        </section>
<script type="text/javascript">

</script>
</body>
</html>
