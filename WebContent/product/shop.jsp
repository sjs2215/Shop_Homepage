<%@ page language="java" contentType = "text/html; charset=euc-kr"
    pageEncoding="EUC-KR" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>�갳 �ֹ��ϱ�</title>
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
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcDriver ="jdbc:mysql://localhost:3306/users_info?useSSL=false";
	String dbUser = "shop";
	String dbPass = "shop1001!";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {

		String query = "select product_price, product_stock from hut_product";
		
		conn = DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
		stmt = conn.createStatement();			
		rs = stmt.executeQuery(query);
		
		while(rs.next()){
%>
			<tr>
				<td><%=rs.getString("product_price")%></td>
				<td><%=rs.getString("product_stock")%></td>
			</tr>
<%
        }
  }catch(SQLException ex){
        out.println(ex.getMessage());
        ex.printStackTrace();
  }finally{
        // 6. ����� Statement ����
        if(rs != null) try { rs.close(); } catch(SQLException ex) {}
        if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}

        // 7. Ŀ�ؼ� ����
        if(conn != null) try { conn.close(); } catch(SQLException ex) {}
  }
%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">               
<section class="our-publication pt-100 pb-70">
            <div class="container">
                <div class="section-header">
                    <i class="fa fa-book"></i>
                    <h2>Our �갳s</h2>
                    <p>world's best �갳 you can find</p>
                </div>
                
                <div class="row">
                    <div class="col-sm-6 col-lg-3"> 
                        <div class="single-publication">
                            <figure>
                                <a href="#">
                                    <img src="https://envytheme.com/tf-demo/edusplash/assets/img/publication/1.jpg" alt="Publication Image">
                                </a>

                                <ul>
                                    <li><a href="#" title="Add to Favorite"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#" title="Add to Compare"><i class="fa fa-refresh"></i></a></li>
                                    <li><a href="#" title="Quick View"><i class="fa fa-search"></i></a></li>
                                </ul>
                            </figure>

                            <div class="publication-content">
                                <span class="category">�갳</span>
                                <h3><a href="#" name="1">�갳 300g</a></h3>
                                <ul>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                </ul>
                                <h4 class="price">$119 <span>$299</span></h4>
                            </div>

                            <div class="add-to-cart">
                                <a href="#" class="default-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-6 col-lg-3"> 
                        <div class="single-publication">
                            <figure>
                                <a href="#">
                                    <img src="https://envytheme.com/tf-demo/edusplash/assets/img/publication/2.jpg" alt="Publication Image">
                                </a>

                                <ul>
                                    <li><a href="#" title="Add to Favorite"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#" title="Add to Compare"><i class="fa fa-refresh"></i></a></li>
                                    <li><a href="#" title="Quick View"><i class="fa fa-search"></i></a></li>
                                </ul>
                            </figure>

                            <div class="publication-content">
                                <span class="category">�갳</span>
                                <h3><a href="#" name="2">�갳 600g</a></h3>
                                <ul>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                </ul>
                                <h4 class="price">$119</h4>
                            </div>

                            <div class="add-to-cart">
                                <a href="#" class="default-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-6 col-lg-3"> 
                        <div class="single-publication">
                            <figure>
                                <a href="#"><img src="https://envytheme.com/tf-demo/edusplash/assets/img/publication/3.jpg" alt="Publication Image"></a>

                                <ul>
                                    <li><a href="#" title="Add to Favorite"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#" title="Add to Compare"><i class="fa fa-refresh"></i></a></li>
                                    <li><a href="#" title="Quick View"><i class="fa fa-search"></i></a></li>
                                </ul>
                            </figure>

                            <div class="publication-content">
                                <span class="category">�갳</span>
                                <h3><a href="#" name="3">�갳 1kg</a></h3>
                                <ul>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                </ul>
                                <h4 class="price">$119</h4>
                            </div>

                            <div class="add-to-cart">
                                <a href="#" class="default-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-6 col-lg-3"> 
                        <div class="single-publication">
                            <figure>
                                <a href="#"><img src="https://envytheme.com/tf-demo/edusplash/assets/img/publication/4.jpg" alt="Publication Image"></a>

                                <ul>
                                    <li><a href="#" title="Add to Favorite"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#" title="Add to Compare"><i class="fa fa-refresh"></i></a></li>
                                    <li><a href="#" title="Quick View"><i class="fa fa-search"></i></a></li>
                                </ul>
                            </figure>

                            <div class="publication-content">
                                <span class="category">�갳</span>
                                <h3><a href="#" name="4">�갳 5kg</a></h3>
                                <ul>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                    <li><i class="icofont-star"></i></li>
                                </ul>
                                <h4 class="price">$119</h4>
                            </div>

                            <div class="add-to-cart">
                                <a href="#" class="default-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
<script type="text/javascript">

</script>
</body>
</html>