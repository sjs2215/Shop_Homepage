<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
    <meta name="google-signin-client_id" content="155546141913-13aaj59tmbnvdhl498otaq3jogvfpseg.apps.googleusercontent.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>양주 하패리 헛개 농장</title>
    
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="css/style.css" rel="stylesheet" media="all" type="text/css">
	<link href="css/responsive.css" rel="stylesheet" media="all" type="text/css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css"> 
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
		<title>Home</title>

    <style type="text/css">
        /*****Reset css********/
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video { margin: 0; padding: 0; border: 0; font-size: 100%; font: inherit; vertical-align: baseline; color:#101010; }
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
body { line-height: 1; }
blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
table { border-collapse: collapse; border-spacing: 0; }
p,label{ font: 300 15px/21px open sans; color: #202020; }
a{ text-decoration:none; font-family:open sans; }
h1,h2,h3,h4,h5,h6,h7{ font-family:open sans; }
input,select,textarea,span{ font-family:open sans; }
/*********Custom Style CSS************/

#main-head {
    display: block;
    position: absolute;
    z-index: 9;
    width: 100%;
}
#main-head nav.navbar {
    margin: 0;
    border: none;
    padding: 15px 0 0 0;
}
#main-head nav.navbar .top-head {
    display: block;
    padding: 10px 0 0 0;
}
#main-head nav.navbar .top-head .scl-links ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
#main-head nav.navbar .top-head .login-box {
    margin: 0 0 0 20px;
    display: inline-block;
    float: right;
}
#main-head nav.navbar .top-head .scl-links {
    float: right;
}
#main-head nav.navbar .top-head .scl-links ul li {
    float: left;
    margin: 0 0 0 5px;
}
#main-head nav.navbar .top-head .scl-links ul li a {
    padding: 9px 0;
    display: inline-block;
    background: #fff;
    border-radius: 25px;
    width: 32px;
    text-align: center;
    text-decoration: none;
    color: #2cc2f7;
    font-size: 14px;
    border: 1px solid #fff;
    height: 32px;
		-webkit-transition: all 500ms;
	-moz-transition: all 500ms;
	-ms-transition: all 500ms;
	-o-transition: all 500ms;
	transition: all 500ms;
}
#main-head nav.navbar .top-head .scl-links ul li:hover a {
    border: 1px solid #2cc2f7;
    background: #2cc2f7;
    color: #fff;
		-webkit-transition: all 500ms;
	-moz-transition: all 500ms;
	-ms-transition: all 500ms;
	-o-transition: all 500ms;
	transition: all 500ms;
}
#main-head nav.navbar .top-head .scl-links ul li a i {
    color: inherit;
}
#main-head nav.navbar .top-head .login {
    float: right;
    background: #2cc2f7;
    color: #fff;
    padding: 6px 16px;
    text-decoration: none;
    font: 500 15px/21px open sans;
    text-transform: uppercase;
}
#main-head nav.navbar .top-head .login::before {
    content: "\f007";
    font-family: fontawesome;
    margin: 0 8px 0 0;
}
#main-head nav.navbar .bot-head .navbar-nav {
    margin: 15px 0 15px 0;
}
#main-head nav.navbar .bot-head #bs-example-navbar-collapse-1 {
    padding: 0;
}
#main-head nav.navbar .bot-head .navbar-nav li a {
    color: #fff;
    padding: 6px 12px !IMPORTANT;
    text-decoration: none;
    font: 500 15px/21px open sans;
    text-transform: uppercase;
    background: transparent;
}
#main-head nav.navbar .bot-head .navbar-nav li:last-of-type a {
    padding: 6px 0px 6px 12px !IMPORTANT;
}
#main-head nav.navbar .bot-head .navbar-brand {
    padding: 0 5px;
    display: inline-block;
    height: auto;
}
/********Home Banner********/
#home-banner #carousel-example-generic {
    height: auto;
    overflow: hidden;
}
#home-banner {
    display: block;
    overflow: hidden;
}
#home-banner .container-fluid {
    padding: 0;
}
#home-banner .slider-wrap .item img {
    width: 100%;
    display: block;
}
#home-banner .slider-wrap .carousel-control {
    background: transparent;
    border: none;
    width: 4%;
    display: flex;
    align-items: center;
    text-align: center;
    opacity: 1;
}
#home-banner .slider-wrap .carousel-control span {
    font-size: 50px;
    color: #fff;
    opacity: 1;
    position: absolute;
    left: 0;
    right: 0;
}
#home-banner .slider-wrap .text-wrap {
    position: absolute;
    left: 0;
    bottom: 50%;
    display: block;
    z-index: 9999999999 !important;
    margin: 0 auto;
    text-align: center;
    width: 64%;
    right: 0;
}
#home-banner .slider-wrap .text-wrap h2 {
    font: 700 40px/51px open sans;
    color: #fff;
    text-transform: uppercase;
}
#home-banner .slider-wrap .text-wrap h1 {
    font: 900 60px/73px open sans;
    color: #2cc2f7;
    text-transform: uppercase;
}
#home-banner .slider-wrap .text-wrap p {
    font: 400 20px/28px open sans;
    color: #ffffff;
    display: block;
    margin: 0 0 1.5rem 0;
}
#home-banner .slider-wrap .button-list .btn-white, #home-banner .slider-wrap .button-list .btn-blue {
    padding: 10px 23px;
    text-decoration: none;
    font: 600 17px/21px open sans;
    text-transform: uppercase;
    margin: 0 5px;
    display: inline-block;
}
#home-banner .slider-wrap .button-list .btn-white {
    background: #fff;
    color: #101010;
}
#home-banner .slider-wrap .button-list .btn-blue { 
	background: #2cc2f7;
    color: #fff;
}
#home-banner .slider-wrap .carousel-indicators li {
    background: #fff;
    border: none;
    height: 12px;
    width: 12px;
    margin: 0;
}
#home-banner .slider-wrap .carousel-indicators li.active {
    background: #2cc2f7;
    border: none;
}

/***End Of Banner***/

.section-heading {
    margin-bottom: 2rem;
}
.section-heading h1 {
    font: 700 30px/45px open sans;
    text-transform: uppercase;
    margin: 0 0 10px 0;
    position: relative;
}
.section-heading h1::after {
    content: '';
    width: 55px;
    height: 3px;
    background: #101010;
    position: absolute;
    bottom: 0px;
    left: 0;
    right: 0;
    margin: 0 auto;
}
.section-heading p {
    font: 600 16px/24px open sans;
    display: block;
    margin: 0 0 1.5rem 0;
}
.btn-blue {
    border: 1px solid #2cc2f7 !important;
    padding: 10px 23px;
    text-decoration: none;
    text-transform: uppercase;
    margin: 0 5px;
    display: inline-block;
    background: #2cc2f7;
    color: #fff;
    font: 600 15px/17px open sans;
}
.btn-blue,.btn-white {    
    position: relative;
    z-index: 1;
}
.btn-blue::after{
	background-color: #fff;
}
.btn-blue::after,.btn-white::after  {
    position: absolute;
    content: "";
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border-radius: 0%;
    -webkit-transform: scale(0);
    -moz-transform: scale(0);
    -ms-transform: scale(0);
    -o-transform: scale(0);
    transform: scale(0);
    z-index: -1;
	-webkit-transition: all 500ms;
	-moz-transition: all 500ms;
	-ms-transition: all 500ms;
	-o-transition: all 500ms;
	transition: all 500ms;
}
.btn-white::after {
    background-color: #2cc2f7;
}
.btn-blue:hover, .btn-blue:focus, .btn-blue:active.focus, .btn-blue:active:focus, .btn-blue:active:hover{
    
}
.btn-blue:hover::after,.btn-white:hover::after {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    -o-transform: scale(1);
    transform: scale(1);
}
#home-banner .slider-wrap .button-list .btn-white:hover,.btn-white:hover::after{
	color: #FFF;
	-webkit-transition: all 500ms;
    -moz-transition: all 500ms;
    -ms-transition: all 500ms;
    -o-transition: all 500ms;
    transition: all 500ms;

}
#home-banner .slider-wrap .button-list .btn-blue:hover, #main-head nav.navbar .top-head .login:hover, .btn-blue:hover {
    color: #101010 !important;
    -webkit-transition: all 500ms;
    -moz-transition: all 500ms;
    -ms-transition: all 500ms;
    -o-transition: all 500ms;
    transition: all 500ms;
}
#men-women {}

#men-women .small {
    background: url("http://www.cybersense.co.nz/images/cybersense.co.nz/for-men-coral-deep-blue-male-fleece-autumn-and-winter-long-section-embossed-sleepwear-robes-51VV.jpg");
    background-size: cover;
    background-position: center;
}
#men-women .main,#men-women .small {
    padding: 40px 20px;
}

.mr-0 {
    margin-right: 0;
}

.ml-0 {
    margin-left: 0;
}

.pl-0 {
    padding-left: 0;
}
.pr-0 {
    padding-right: 0;
}
#men-women .small h2 {
    font: 700 20px/31px open sans;
    color: #fff;
    text-transform: uppercase;
}
#men-women .main h2 {
    font: 700 20px/31px open sans;
    text-transform: uppercase;
}

#men-women .small p {
    font: italic 500 15px/21px open sans;
    color: #ffff;
    margin: 0 0 .5rem 0;
}
#men-women .main p {
    font: italic 500 15px/21px open sans;
    margin: 0 0 .5rem 0;
}

.btn-white {
    padding: 10px 23px;
    text-decoration: none;
    font: 600 15px/17px open sans;
    text-transform: uppercase;
    margin: 0 5px;
    display: inline-block;
    background: #fff;
    color: #101010;
}
.btn-blue, .btn-white {
    text-decoration: none !important;
}

/***services***/
#services{
	padding:3% 0;
}
#services .service-list .service a {
    font: 700 20px/31px open sans;
    text-transform: uppercase;
    text-decoration: none;
    color: #101010;
}
#services .service-list .service p {
    font: 300 15px/21px open sans;
    color: #202020;
    margin: 0 0 .5rem 0;
}

#services .service-list .service.bottom {
    margin-top: 2rem;
}

#services .service-list .service.top {
    margin-top: 1rem;
}
#services .image-wrap {
    border-radius: 50%;
    overflow: hidden;
    border: 1px solid #ccc;
    padding: 10px;
}

#services .image-wrap img {
    border-radius: 50%;
}
#men-women {
    background: #f4f4f4;
}
#services .service {
    position: relative;
}

#services .service .icon-wrap {
    position: absolute;
    border: 1px solid #ccc;
    width: 50px;
    height: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50px;
    font-size: 24px;
    background: #fff;
    z-index: 9;
}

#services .service-list .service-left .service.top .icon-wrap {
    right: -115px;
}
#services .service-list .service-left .service.bottom.mid .icon-wrap {
    right: -55px;
}

#services .service-list .service-left .service.bottom .icon-wrap {
    right: -95px;
}
#services .service-list .service-right .service.top .icon-wrap {
    left: -115px;
}
#services .service-list .service-right .service.bottom.mid .icon-wrap {
    left: -55px;
}

#services .service-list .service-right .service.bottom .icon-wrap {
    left: -95px;
}

/***products***/
#product-list {
    background: #f4f4f4;
    padding: 3% 0;
}

#product-list .product-list {}

#product-list .product-list .productw-wrap {
    border: 2px dashed #dedede;
}

#product-list .product-list .prduct-text {
    padding: 15px;
    border-top: 1px solid #dedede;
}

#product-list .product-list .prduct-text .name {
    font: 600 17px/21px open sans;
    text-decoration: none;
    color: #101010;
    margin: 0 0 .1rem 0;
    display: inline-block;
    width: 100%;
}

#product-list .product-list .prduct-text .price {
    font: 700 15px/21px open sans;
    clear: both;
    display: block;
    color: #999999;
}

#product-list .product-list .prduct-text ins.price {
    margin: 0 0 .3rem 0;
    color: #2cc2f7;
    text-decoration: none;
}
#product-list .product-list .prduct-text .btn-blue {
    border-radius: 0;
    margin: 0;
}
/*team introduce background image*/
#team {
    padding: 3% 0;
    background-image: url(img/img002.jpg);
}
#testimonial {
    padding: 3% 0;
	background-image: url(https://www.sealswcc.com/images/background/background-videos-desaturated.jpg);
}

.dark.text-center {}

.section-heading.dark {}

.section-heading.dark h1 {
    color: #fff;
}

.section-heading.dark h1:after {
    background: #fff;
}
#team .slider-wrap {
    max-width: 900px;
    margin: 0 auto;
}
#team .slider-wrap .carousel-inner {}

#team .slider-wrap .carousel-inner img,#testimonial .slider-wrap .carousel-inner img {
    width: 100%;
    border-radius: 50%;
}
#team .slider-wrap .item .img-wrap,#testimonial .slider-wrap .item .img-wrap {
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 50%;
}

#team .slider-wrap .carousel-control {
    width: 30px;
    top: calc(50% - 10px);
    bottom: unset;
    color: #fff;
    background: transparent;
    opacity: 1;
}
#testimonial .slider-wrap .carousel-control {
    width: 30px;
    top: calc(50% - 10px);
    bottom: unset;
    color: #fff;
    background: transparent;
    opacity: 1;
}

#team .slider-wrap .carousel-control i {
    color: inherit;
}
#testimonial .slider-wrap .carousel-control i {
    color: inherit;
}
#team .slider-wrap .item h2{
    font: 600 17px/21px open sans;
    color: #fff;
    margin: 0 0 .5rem;
}
#testimonial .slider-wrap .item h2 {
    font: 600 17px/21px open sans;
    margin: 0 0 .5rem;
	color: #fff;
}

#team .slider-wrap .item p {
    font: 500 15px/21px open sans;
    color: #fff;
}
#testimonial .slider-wrap .item p {
    font: 500 15px/21px open sans;
	color: #fff;
}
#team .slider-wrap .carousel-indicators {
    bottom: -30px;
}
#testimonial .slider-wrap .carousel-indicators {
    bottom: -30px;
}

#team .slider-wrap .carousel-indicators li {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    overflow: hidden;
    margin: 0 2px;
}
#team .slider-wrap .left.carousel-control {
    left: -50px;
    font-size: 27px;
}
#testimonial .slider-wrap .left.carousel-control {
    left: -50px;
    font-size: 27px;
}
#team .slider-wrap .right.carousel-control {
    right: -50px;
    font-size: 27px;
}
#testimonial .slider-wrap .right.carousel-control {
    right: -50px;
    font-size: 27px;
}





/******Responsive starts Here******/
@media screen and (width:1280px){


}

@media only screen and (min-device-width : 1024px) and (max-device-width : 1366px) and (orientation : landscape){


}
@media only screen and (min-device-width : 1024px) and (max-device-width : 1366px) and (orientation : portrait){


}

@media screen and (width:1024px){

	
}

@media screen and (width:800px){


}



@media only screen and (min-device-width : 768px) and (max-device-width : 1024px) and (orientation : landscape){
#home-banner #carousel-example-generic {
    height: auto;
}
#home-banner .slider-wrap .text-wrap {
    bottom: 24%;
    width: 80%;
}
#home-banner .slider-wrap .text-wrap p {
    font: 400 17px/24px open sans;
    margin: 0 0 1rem 0;
}
#home-banner .slider-wrap .text-wrap h1 {
    font: 900 40px/52px open sans;
}
#home-banner .slider-wrap .text-wrap h2 {
    font: 700 30px/42px open sans;
    color: #fff;
}
#main-head nav.navbar .bot-head .navbar-header {
    width: 27%;
}
#main-head nav.navbar .bot-head .navbar-brand {
    width: 100%;
}
#main-head nav.navbar .bot-head .navbar-nav li a {
    padding: 6px 10px !IMPORTANT;
    font: 500 12px/21px open sans;
}
#main-head nav.navbar .bot-head .navbar-nav {
    margin: 7px 0 0 0;
}
#main-foot .trm .terms {
    clear: both;
    display: inline-block;
}
}



@media only screen and (min-device-width : 768px) and (max-device-width : 1024px) and (orientation : portrait){
/******Home Page********/
#home-banner #carousel-example-generic {
    height: auto;
}
#home-banner .slider-wrap .text-wrap { 
    bottom: 11%;
    width: 80%;
}
#home-banner .slider-wrap .text-wrap p {
    font: 400 17px/24px open sans;
    margin: 0 0 1rem 0;
}
#home-banner .slider-wrap .text-wrap h1 {
    font: 900 40px/52px open sans;
}
#home-banner .slider-wrap .text-wrap h2 {
    font: 700 30px/42px open sans;
    color: #fff;
}
#main-head nav.navbar .bot-head .navbar-header {
    width: 27%;
}
#main-head nav.navbar .bot-head .navbar-brand {
    width: 100%;
}
#main-head nav.navbar .bot-head .navbar-nav li a {
    padding: 6px 10px !IMPORTANT;
    font: 500 12px/21px open sans;
}
#main-head nav.navbar .bot-head .navbar-nav {
    margin: 7px 0 7px 0;
}
#search .search-form fieldset select {    
    padding: 10px 17px 10px 6px;
    font: 600 12px/24px open sans;
    background-position: right 3px top 54%;
}
.section-heading p {
    font: 600 15px/24px open sans;
}
#main-foot .trm .terms {
    clear: both;
    display: inline-block;
}
}


@media screen and (width:768px){


}

@media screen and (min-width: 768px) {


}


@media screen and (width:600px){


}




@media screen and (max-width:767px){
#main-head nav.navbar {
    margin: 0;
    border: none;
    padding: 10px 0 10px 0;
}
#services .service .icon-wrap {
    display: none;
}
#team .slider-wrap .right.carousel-control {
    right: 0;
}
#testimonial .slider-wrap .right.carousel-control {
    right: 0;
}
#team .slider-wrap .left.carousel-control {
    left: 0;
}
#testimonial .slider-wrap .left.carousel-control {
    left: 0;
}
#men-women .main, #men-women .small {
    padding: 20px 20px;
}
#services .service-list .service a {
    font: 700 17px/31px open sans;
}
#services .service-list .service-left, #services .service-list .service-right {
    text-align: center;
}
#product-list .product-list .productw-wrap {
    border: 2px dashed #dedede;
    margin: 0 0 1rem;
}
#services .image-wrap {
    max-width: 59%;
    margin: 0 auto;
}
#team .slider-wrap .carousel-indicators {
    /* bottom: -30px; */
    display: none;
}
#main-head {
    position: unset;
    box-shadow: 0 0px 6px rgba(44,194,247,.25);
}
#team .slider-wrap .item,#testimonial .slider-wrap .item{
	text-align:center;
}
#team .slider-wrap .item .img-wrap,#testimonial .slider-wrap .item .img-wrap {
    max-width: 200px;
    display: block;
    margin: 0 auto 1rem;
}
#main-head nav.navbar .top-head .login {
    padding: 5px 10px;
    font: 600 12px/16px open sans;
}
#main-head nav.navbar .top-head .login-box {
    margin: 0 0 0 10px;
}
#main-head nav.navbar .top-head .login-box .reg {
    margin: 0 0px 0 5px;
}
#main-head nav.navbar .top-head .scl-links ul li a {
    padding: 5px 0;
    width: 26px;
    font-size: 13px;
    color: #fff;
    background: #2cc2f7;
    height: 26px;
}
#main-head nav.navbar .top-head .login::before {
    display: none;
}
#main-head nav.navbar .bot-head .navbar-brand {
    width: 76%;
    padding: 0px 0;
}
#main-head nav.navbar .bot-head .navbar-toggle {
    border: 1px solid #2cc2f7;
    margin: 3% 0 3% 0;
}
#main-head nav.navbar .bot-head .navbar-toggle .icon-bar {
    background: #2cc2f7;
}
#main-head nav.navbar .bot-head .navbar-nav {
    margin: 0px 0 10px 0;
}
#main-head nav.navbar .bot-head .navbar-nav li a {
    color: #000;
    padding: 7px 12px !IMPORTANT;
    font: 500 13px/16px open sans;
    display: inline-block;
}
#main-head nav.navbar .bot-head .navbar-nav li a::after {
    background: #000;
}
#main-head nav.navbar .bot-head .navbar-nav li:last-of-type a {
    padding: 7px 10px;
}
#home-banner .slider-wrap .text-wrap {
    bottom: 15%;
    width: 85%;
}
#home-banner #carousel-example-generic {
    height: auto;
    overflow: hidden;
}
#home-banner .slider-wrap .text-wrap h2 {
    font: 700 16px/20px open sans;
}
#home-banner .slider-wrap .text-wrap h1 {
    font: 900 20px/21px open sans;
    margin: 0 0 0px 0;
}
#home-banner .slider-wrap .text-wrap p {
    font: 400 14px/16px open sans;
    margin: 0 0 .5rem 0;
}
#home-banner .slider-wrap .button-list .btn-white, #home-banner .slider-wrap .button-list .btn-blue {
    padding: 8px 10px;
    font: 600 12px/16px open sans;
}
#home-banner .slider-wrap .carousel-control span {
    font-size: 25px;
}
.section-heading {
    margin-bottom: 1rem;
}
.section-heading h1 {
    font: 700 20px/30px open sans;
}
.section-heading h1::after {
    width: 100px;
}
.section-heading p {
    font: 500 14px/23px open sans;
}

}

/*************************Phones start here************************************/
/**********IPHONE 6 PLUS ****************/
@media only screen and (min-device-width : 414px) and (max-device-width : 736px) and (orientation : landscape){



}
@media only screen and (min-device-width : 414px) and (max-device-width : 736px) and (orientation : portrait) {



}





/**********Nexus 5X ****************/
@media only screen and (min-device-width : 412px) and (max-device-width : 732px) and (orientation : landscape){


}
@media only screen and (min-device-width : 412px) and (max-device-width : 732px) and (orientation : portrait) {


}



/**********IPHONE 6***************/
@media only screen and (min-device-width : 375px) and (max-device-width : 667px) and (orientation : landscape){


}
@media only screen and (min-device-width : 375px) and (max-device-width : 667px) and (orientation : portrait) {


}




/**********Galaxy 5s, Galaxy Note3, Galaxy Note2,Galaxy S3***************/
@media only screen and (min-device-width : 360px) and (max-device-width : 640px) and (orientation : landscape){


}
@media only screen and (min-device-width : 360px) and (max-device-width : 640px) and (orientation : portrait) {

}




/*******************IPHONE 5s************************/
@media only screen and (min-device-width : 320px) and (max-device-width : 568px) and (orientation : landscape){


}

@media only screen and (min-device-width : 320px) and (max-device-width : 568px) and (orientation : portrait) {


}
@media screen and (width:320px){


}
@media only screen and (min-device-width : 320px) and (max-device-width : 480px) and (orientation : landscape){


}

@media only screen and (min-device-width : 320px) and (max-device-width : 480px) and (orientation : portrait){

}

/******Responsive ends Here******/

@import url('https://fonts.googleapis.com/css?family=Droid+Sans:400,700|Raleway');
.align-text-left {
  text-align: left;
}

.align-text-right {
  text-align: right;
}

.color-white {
  color: #FFF;
}

.padding-top-ten-px {
  padding-top: 10px;
}

.padding-top-fiftheen-px {
  padding-top: 15px;
}

.no-padding {
  padding: 0;
  margin: 0;
}

.primary {
  border-bottom: solid 3px #E98300;
  width: 40%;
}

.social-sharing {
  color: #C3C3C3;
  font-size: 14px;
  font-weight: 600;
  transition: all .25s;
  cursor: pointer;
  font-family: 'Raleway', sans-serif;
}

a.social-sharing:link {
  color: #C3C3C3;
  font-size: 14px;
  font-weight: 600;
  transition: all .25s;
  cursor: pointer;
  font-family: 'Raleway', sans-serif;
}

a.social-sharing:hover {
  color: #9fc163;
  font-size: 14px;
  font-weight: 600;
  transition: all .25s;
  cursor: pointer;
  font-family: 'Raleway', sans-serif;
}

footer {
  background-color: #242424;
  padding: 15px;
}

a.footerlink {
  color: #C3C3C3;
  font-size: 14px;
  font-weight: 600;
  transition: all .25s;
  cursor: pointer;
  text-decoration: none;
  font-family: 'Raleway', sans-serif;
}

a.footerlink:hover {
  color: #9fc163;
  font-size: 14px;
  font-weight: 600;
  transition: all .35s;
  cursor: pointer;
  text-decoration: none;
}

p,
span {
  font-family: 'Droid Sans', sans-serif;
}
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
    
    <jsp:useBean id="user" class="advisor.UserVO">
		<jsp:setProperty name="user" property="*"/>
    </jsp:useBean>
	<%
		String uid2 = (String)session.getAttribute("uid");
		UserBean USER = UserBean.getInstance(); 
   	  
		//변수 uid(user 테이블의 user_name 컬럼)로 (user 테이블의 user_id 컬럼)알아냄.
    	int name = USER.get_user_name(uid2);
    	 
    	//admin 유저인지 체크
    	int check = USER.adminCheck(name);
    	
    	//admin 유저인데 승인처리 되어있는지 체크
    	int admin_flgcheck = USER.admin_flgCheck(name);
	%>
  
    <script type="text/javascript"> 
    
    function signOut() {
      var auth2 = gapi.auth2.getAuthInstance();
      //google log out
      auth2.signOut().then(function () {
        console.log('(google)User signed out.');
      });
      //db log out
      location.replace("/user/logOut.jsp");
    }

    function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
    
     function mypage_check(){ 
    	 var uid = '<%=(String)session.getAttribute("uid")%>';
    	 
     	 if(uid=="null"){ 
     		swal("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요", "error"); 
     	 }
     	 else{
     		location.replace("/user/mypageForm.jsp");
     	 }
    }

     function cart_check(){ 
    	 var uid = '<%=(String)session.getAttribute("uid")%>';
    	 
     	 if(uid=="null"){ 
     		swal("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요", "error"); 
     	 }
     	 else{
     		location.replace("/product/shoppingcart2.jsp");
     	 }
    }   

     function admin_check(){ 
    	 var uid = '<%=(String)session.getAttribute("uid")%>';
    	 
    	 if(uid=="null"){ //로그인 정보 없을 시
     		swal("관리자 계정으로 로그인을 해주세요","접속된 세션 정보가 없습니다.", "error"); 
     	 }
    	 
    	 if(uid!="null"&&<%=check%>==0){ //일반 계정으로 로그인 시
    		 swal("관리자만 접근 가능합니다.","관리자로 회원가입 후 승인을 기다려주세요.", "error"); 
    	 }
    	 else if(uid!="null"&&<%=check%>==1){ //admin 계정으로 로그인 시
    		 location.replace("/admin/admin.jsp");
    	 }
    	 
    	 if(uid!="null"&&<%=admin_flgcheck%>==0&&<%=check%>==1){ //admin 계정으로 로그인 하였으나 아직 승인 처리 안 되었을 때
    		 swal("승인 심사가 완료되지 않았습니다.","관리자 계정으로 회원가입을 한 경우,\n 승인 심사는 약 7일 정도 소요됩니다.\n 자세한 사항은 담당자에게 문의해주세요.\n이메일 문의: soojinsarah@naver.com", "error");
    	 }
    }
 	</script>

 
</head>

<%
	String uid = (String)session.getAttribute("uid");
	if(uid!=null){
		uid=", "+uid+"님";
	}
	else{
		uid="";
	}

%>

<body>


<!-- footer start -->
<div class="padding-top-fiftheen-px"></div>
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
          <a href="#" class="footerlink" rel="index,follow" title="Header 1">Header 1</a>
          <p class="text-muted small padding-top-fiftheen-px">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
          <div class="align-text-right hidden-lg hidden-md hidden-sm">
            <a href="#" id="ButtonLink" class="btn btn-warning btn-sm">more<i class="fa fa-chevron-right padding-left-five-px"></i></a>
            <div class="clearfix"></div>
            <hr class="color-white">
            <div class="mouse-help"></div>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
          <a href="#" class="footerlink" rel="follow" title="Header 2">Header 2</a>
          <p class="text-muted small padding-top-fiftheen-px">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
          <div class="align-text-right hidden-lg hidden-md hidden-sm">
            <a href="#" id="ButtonLink" class="btn btn-warning btn-sm">more<i class="fa fa-chevron-right padding-left-five-px"></i></a>
            <div class="clearfix"></div>
            <hr class="color-white">
            <div class="mouse-help"></div>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
          <a href="#" class="footerlink" rel="follow" title="Header 3">Header 3</a>
          <p class="text-muted small padding-top-fiftheen-px">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
          <div class="align-text-right hidden-lg hidden-md hidden-sm">
            <a href="#" id="ButtonLink" class="btn btn-warning btn-sm">more<i class="fa fa-chevron-right padding-left-five-px"></i></a>
            <div class="clearfix"></div>
            <div class="mouse-help"></div>
          </div>
        </div>
      </div>
      <div class="col-sm-12 col-xs-12 clearfix hidden-lg hidden-md">
        <div class="padding-top-fiftheen-px"></div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 column text-center">
        <span class="social-sharing">Connect & Share</span>
        <br> <br> <br>
        <div class="clearfix hidden-md hidden-sm hidden-xs padding-top-fiftheen-px"></div>
        <div class="clearfix hidden-lg hidden-md hidden-sm padding-top-ten-px"></div>
        <div class="clearfix hidden-lg hidden-xs">
          <hr class="primary">
        </div>

        <div class="col-lg-12 text-center clearfix">
          <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 no-padding">
            <div class="col-sm-6 col-xs-6"><a href="https://www.facebook.com/@PartnerFacebook" title="Share on Facebook" class="social-sharing" target="_blank"><i class="fa fa-2x fa-facebook-square"></i></a></div>
            <div class="col-sm-6 col-xs-6"><a href="https://twitter.com/@PartnerTwitterHandle" title="Share on Twitter" class="social-sharing" target="_blank"><i class="fa fa-2x fa-twitter-square"></i></a></div>
          </div>
          <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 no-padding">
            <div class="col-sm-6 col-xs-6"><a href="https://www.instagram.com/@PartnerInstagram" title="Share on Instagram" rel="index,follow" class="social-sharing" target="_blank"><i class="fa fa-2x fa-instagram"></i></a></div>
            <div class="col-sm-6 col-xs-6"><a href="https://www.linkedin.com/company/@PartnerLinkedIn" title="Share on LinkedIn" rel="index,follow" class="social-sharing" target="_blank"><i class="fa fa-2x fa-linkedin-square"></i></a></div>
          </div>
          <div class="col-sm-12 col-xs-12 clearfix hidden-lg hidden-md hidden-sm padding-top-eight-px"></div>
          <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 no-padding">
            <div class="col-sm-6 col-xs-6"><a href="https://www.pinterest.com/@PartnerPinterest" title="Share on Pinterest" rel="index,follow" class="social-sharing" target="_blank"><i class="fa fa-2x fa-pinterest-square"></i></a></div>
            <div class="col-sm-6 col-xs-6"><a href="https://www.youtube.com/" title="Share on YouTube" rel="index,follow" class="social-sharing" target="_blank"><i class="fa fa-2x fa-youtube-square"></i></a></div>
          </div>
          <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 no-padding">
            <div class="col-sm-6 col-xs-6"><a href="https://play.google.com/store/apps/details?id=com.propay.mobile" title="Download from Google Play" rel="index,follow" class="social-sharing" target="_blank"><i class="fa fa-2x fa-android"></i></a></div>
            <div class="col-sm-6 col-xs-6"><a href="https://itunes.apple.com/us/app/propay-accept-credit-cards/id433046878?mt=8" rel="index,follow" title="Download from Apple Store" class="social-sharing" target="_blank"><i class="fa fa-2x fa-apple"></i></a></div>
          </div>
        </div>

      </div>
    </div>
    <hr>
    <div class="col-lg-12 col-md-12 no-padding">
      <div class="hidden-sm hidden-xs">
        <div class="col-lg-8 col-md-8 align-text-left">
        <a href="#" class="footerlink" rel="follow" title="Header 3">Our Location</a><br><br>
          <span class="text-muted small">Company, Inc. | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</span>
        </div>
        <div class="col-lg-4 col-md-4 align-text-right">
            <div class="col-md-4">
		    	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d202404.21945343298!2d126.84946295011362!3d37.565289400000324!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca28b61c565cd%3A0x858aedb4e4ea83eb!2z7ISc7Jq47Yq567OE7Iuc!5e0!3m2!1sko!2skr!4v1585294228562!5m2!1sko!2skr" sytle="" frameborder="0" style="border:0" allowfullscreen></iframe>
		    </div>
        </div>
      </div>
    </div>
  </div>

</footer>
</body>


