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
    	 
    	 if(uid!="null"&&<%=admin_flgcheck%>==0&&<%=check%>==0){ //admin 계정으로 로그인 하였으나 아직 승인 처리 안 되었을 때
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
<header id="main-head">
	<nav class=" navbar  navbar-bootsnipp " role="navigation">
		<div class="container">
			<div class="bot-head">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class=" navbar-header ">
					<button type="button" class=" navbar-toggle " data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class=" sr-only ">Toggle navigation</span>
						<span class=" icon-bar "></span>
						<span class=" icon-bar "></span>
						<span class=" icon-bar "></span>
					</button>
					<div class="brand ">
						<a class=" navbar-brand" href="#"><img src="img/main_logo.png" class="img-responsive"/></a>
					</div>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class=" collapse navbar-collapse " id="bs-example-navbar-collapse-1">
					<ul class=" nav navbar-nav navbar-right ">
						<li class="active"><a href="index.html">홈</a></li>
						<li class=""><a href="#services">헛개의 효능</a></li>
						<li class=""><a href="#" onClick="cart_check();">장바구니</a></li>
						<li class="" id="mypage"><a href="#" onClick="mypage_check();">마이 페이지</a></li>
						<li class=""><a href="/user/registerForm.jsp">회원가입</a></li>
						<li class=""><a href="/user/signinForm.jsp">로그인</a></li>
						<li class=""><a href="#" onClick="signOut();">로그아웃</a></li>						
					    <li class=""><a href="#" onClick="admin_check();">관리자 페이지</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</header>
<section id="home-banner">
	<div class="container-fluid">
		<div class="slider-wrap">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
			  <!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div class="slide-1">
							<img src="img/img001.jpg" class="img-responsive"/>
						</div>
						<div class="text-wrap ">
							<h2 id="change_name">Discover The Best<%=uid %></h2> 
							<h1>WELCOME TO OUR 헛개농장</h1>
							<p>몸에 좋은 헛개! 저희 농장에서는 국산 100% 품질보장된 열매만 판매합니다.</p>
							<div class="button-list">
								<a href="/user/registerForm.jsp" class="banner-button btn-blue hidden-xs">사이트 가입하기</a>
								<a href="/product/shop.jsp" class="banner-button btn-white">헛개 주문하기</a> 
							</div>
						</div>
					</div>
					<div class="item">
						<div class="slide-1">
							<img src="img/img002.jpg" class="img-responsive"/>
						</div>
						<div class="text-wrap ">
							<h2 id="change_name">Discover The Best<%=uid %></h2>
							<h1>WELCOME TO OUR 헛개농장</h1>
							<p>몸에 좋은 헛개! 저희 농장에서는 국산 100% 품질보장된 열매만 판매합니다.</p>
							<div class="button-list">
								<a href="" class="banner-button btn-blue hidden-xs">사이트 가입하기</a>
								<a href="" class="banner-button btn-white">헛개 더 알아보기</a> 
							</div>
						</div>
					</div>
					<div class="item">
						<div class="slide-1">
							<img src="img/img003.jpg" class="img-responsive"/>
						</div>
						<div class="text-wrap ">
							<h2 id="change_name">Discover The Best<%=uid %></h2>
							<h1>WELCOME TO OUR 헛개농장</h1>
							<p>몸에 좋은 헛개! 저희 농장에서는 국산 100% 품질보장된 열매만 판매합니다.</p>
							<div class="button-list">
								<a href="" class="banner-button btn-blue hidden-xs">사이트 가입하기</a>
								<a href="" class="banner-button btn-white">헛개 더 알아보기</a> 
							</div>
						</div>
					</div>
				</div>
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
					<span class="fa fa-angle-left"></span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
					<span class="fa fa-angle-right"></span>
				</a>
			</div>
		</div>
	</div>
</section>
<section id="services">
	<div class="container">
		<div class="section-heading text-center">
			<h1>헛개의 효능</h1>
		</div>
		<div class="service-list">
			<div class="row">
				<div class="col-sm-4">
					<div class="service-left text-right">
						<div class="service top">
							<div class="icon-wrap">
								<i class="fa fa-free-code-camp" aria-hidden="true"></i>
							</div>
							<a href="">숙취해소</a>
							<p>숙취의 주요 원인인 분해되지 않는 아세트알데히드의 빠른 분해를 돕고, 외부로의 배출을 도와주기 때문에 숙취해소에 탁월한 효능이 있습니다.</p>
						</div>
						<div class="service bottom mid">
							<div class="icon-wrap">
								<i class="fa fa-free-code-camp" aria-hidden="true"></i>
							</div>
							<a href="">간건강</a>
							<p>헛개나무에 다량 함유되어 있는 오메가3 지방산과 여러 아미노산 성분 등의 간의 기능 저하를 유발하는 독소배출과 함께 간세포 활성화에 도움을 주어 간건강 및 간기능 향상에 큰 도움이 됩니다.</p>
						</div>
						<div class="service bottom">
							<div class="icon-wrap">
								<i class="fa fa-free-code-camp" aria-hidden="true"></i>
							</div>
							<a href="">이뇨작용</a>
							<p>헛개나무에 다량 함유되어 있는 칼륨 성분이 체내 쌓인 독소 및 노폐물을 외부로 배출시켜주는 작용을 해줌으로써 이뇨작용에 탁월한 효과가 있습니다.</p>
						</div>
						
					</div>
				</div>
				<div class="col-sm-4">
					<div class="image-wrap">
						<img src="https://t1.daumcdn.net/cfile/tistory/216E3A38574BE83E0B" class="img-responsive">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="service-right text-left">
						<div class="service top">
							<div class="icon-wrap">
								<i class="fa fa-free-code-camp" aria-hidden="true"></i>
							</div>
							<a href="">변비예방</a>
							<p>헛개나무를 꾸준히 섭취하게 되면 장운동 활성화로 인해 배변활동을 원활하게 해주어 변비를 예방하는데도 큰 효과가 있습니다.</p>
						</div>
						<div class="service bottom mid">
							<div class="icon-wrap">
								<i class="fa fa-free-code-camp" aria-hidden="true"></i>
							</div>
							<a href="">관절염 완화</a>
							<p>헛개나무는 체내 유해한 독소나 염증을 제거하는데 뛰어난 효과가 있기 때문에 관절에 염증이 생겨 발생하는 관절염을 예방하는 데도 큰 효과를 발휘합니다.</p>
						</div>
						<div class="service bottom">
							<div class="icon-wrap">
								<i class="fa fa-free-code-camp" aria-hidden="true"></i>
							</div>
							<a href="">피로회복</a>
							<p>헛개나무에 풍부하게 함유되어 있는 다양한 무기질 성분과 아미노산 성분들이 신진대사를 촉진하고, 혈액순환을 개선시켜 피로를 회복하는데 큰 도움을 줍니다.</p>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</section>

<section id="team">
	<div class="container">
		<div class="section-heading dark text-center">
			<h1>Our Team</h1>
		</div>
		<div class="slider-wrap">
			<div class="carousel slide" data-ride="carousel" id="quote-carousel">
				<!-- Bottom Carousel Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#quote-carousel" data-slide-to="0" class="active">
						<img class="img-responsive " src="img/theme_pic.jpg" alt="">
					</li>	
				</ol>
				
				<div class="carousel-inner">
					
					<div class="item active">
						<div class="row">	
							<div class="col-sm-2">
								<div class="img-wrap">
									<img src="img/theme_pic.jpg" class="img-responsive">
								</div>
							</div>
							<div class="col-sm-10">
								<h2>Sarah Park</h2>
								<p>Software Engineer</p>
								<p>Created with <i class="fa fa-heart"></i> by <a href="https://github.com/sjs2215">Sarah Park</a></p>
								
							</div>
						</div>
					</div>
					
				
				</div>

				<a data-slide="prev" href="#quote-carousel" class="left carousel-control"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
				<a data-slide="next" href="#quote-carousel" class="right carousel-control"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
			</div>
		</div>
	</div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>

<script type="text/javascript">

</script>
</body>
</html>
