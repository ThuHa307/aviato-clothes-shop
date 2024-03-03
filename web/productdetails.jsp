<%-- 
    Document   : aophong
    Created on : Feb 18, 2024, 8:09:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Include Owl Carousel JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    </head>
    <body>
        <%@ include file="header.jsp" %>
        <c:set var="product" value="${product}"></c:set>
            <!--chi tiết sản phẩm-->
            <section class="product container">
                <style>
                    .product{
                        width: 100%;
                        position: relative;
                        padding-left: 0;
                        margin-top: 20px;
                    }
                    .product-top{
                        margin-bottom: 30px;
                    }
                    .product-top p{
                        font-family: 'Product sans';
                        font-size: 12px;
                        margin: 0 12px;
                    }
                    .product-content{
                        align-items: flex-start;
                    }
                    .product-content-left{
                        width: 50%;
                    }

                    .product-content-left-big-img{
                        width: 100%;
                    }
                    .product-content-left-big-img img{
                        width: 100%;
                        padding: 10px;
                    }
                    .product-content-left-small-img{
                        width: 20%;
                    }
                    .product-content-left-small-img img{
                        width: 100%;
                        cursor: pointer;
                        padding: 0px 10px 8px 10px;
                    }
                    .product-content-right{
                        width: 50%;
                    }
                    .product-content-right-product-name h1{
                        color: #000;
                        margin: 0 0 15px 0;
                        font-weight: 700;
                        line-height: 1.2;
                        font-family: 'Product sans';
                    }
                    .product-content-right-product-name p{
                        display: block;
                        margin-block-start: 1em;
                        margin-block-end: 1em;
                        margin-inline-start: 0px;
                        margin-inline-end: 0px;
                    }
                    .product-content-right-product-price{
                        margin: 18px 0;
                        padding: 0;
                    }
                    .product-content-right-product-price span {
                        font-size: 20px;
                        line-height: 28px;
                        font-weight: 500;
                    }
                    .product-content-right-product-price del{
                        font-size: 16px;
                        line-height: 24px;
                        color: gray;
                        margin-left: 8px;
                    }
                    .product-content-right-product-color{
                        display: flex;
                        align-items: center;
                        flex-wrap: wrap;
                        margin-bottom: 20px;
                        gap: 12px;
                        padding: 0px;
                    }
                    .product-content-right-product-color .item-swatch{
                        border: 1px solid #FFFFFF;
                        border-radius: 100%;
                        cursor: pointer;
                        padding: 1px;
                        box-shadow: 0 0 1px 1px #e6e6e6;
                        margin: 0px;
                    }
                    .product-content-right-product-color .item-swatch.active{
                        box-shadow: 0 0 1px 1px #000000;
                    }
                    .product-content-right-product-color .item-swatch img{
                        width: 32px;
                        height: 32px;
                        border-radius: 100%;
                    }
                    .product-content-right-product-size.open-size-chart {
                        display: flex;
                        align-items: center;
                        cursor: pointer;
                    }
                    .product-content-right-product-size{
                        margin: 10px 0 15px 0;
                    }
                    .size span.active {
                        background-color: #000000;
                        color: #fff;
                    }
                    .size span{
                        display: inline-block;
                        padding: 8px 10px;
                        border: 1px solid #dddddd;
                        margin: 0px 10px 12px 0;
                        font-size: 12px;
                        cursor: pointer;
                    }
                    .quantity{
                        display: flex;
                        margin: 15px 10px 12px 0;
                    }
                    .quantity input{
                        width: 50px;
                        padding-left: 3px;
                        margin: 0px 10px 12px 15px;
                        text-align: center;
                    }
                    .product-content-right-product-button{
                        background: #000000;
                        height: 56px;
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        margin: 24px 0 0 0;
                    }
                    .product-content-right-product-button button{
                        width: 49%;
                        border: none;
                        background: transparent;
                        font-size: 16px;
                        line-height: 20px;
                        color: #FFFFFF;
                        text-transform: uppercase;
                        font-weight: 400;
                        height: 56px;

                    }
                    .product-content-right-product-button button#btn-buynow{
                        background: #B01722;
                    }
                    .product-content-right-bottom {
                        padding-top: 40px;
                        border-top: 1px solid #dddddd;
                        position: relative;
                    }
                    .product-content-right-bottom-top{
                        position: absolute;
                        width: 30px;
                        height: 30px;
                        border: 1px solid #dddddd;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        background-color: #fff;
                        top: -15px;
                        left: 50%;
                        border-radius: 50%;
                        transform: translateX(-50%);
                        cursor: pointer;
                    }
                    .choose-size{
                        display: flex;
                        justify-content: space-between;
                    }
                    .product-content-right-bottom-content-title{
                        display: flex;
                        align-items: center;
                        justify-content: center;
                    }
                    .product-content-right-bottom-content-title-item{
                        width: 30%;
                        text-align: center;
                        font-size: 14px;
                        line-height: 20px;
                        color: #000000;
                        padding: 12px 0px;
                        border-bottom: 1px solid #FFFFFF;
                        text-transform: uppercase;
                        cursor: pointer;
                    }
                    .product-content-right-bottom-content-title-item.active{
                        color: #000000;
                        border-color: #000000;
                    }
                    .product-content-right-bottom-content{
                        padding-top: 20px;
                        line-height: 30px;
                    }
                    .product-content-right-bottom-content-title-item p{
                        font-family: 'Product sans';
                    }
                    .product-content-right-bottom-content{
                        padding-top: 0px;
                    }
                    .product-content-right-bottom-content {
                        font-family: 'Product sans';
                        font-size: 14px;
                    }
                    .activeB{
                        display: none;
                    }

                </style>

            <c:set var="products" value="${familiar}"></c:set>
                <div class="container">
                    <div class="product-content row">
                        <div class="col-md-6 product-content-left row">
                            <div class="product-content-left-big-img">
                                <img src="${product.image}" alt="">
                        </div>
                        <div class="product-content-right-bottom">
                            <div class="product-content-right-bottom-top">
                                &#8744;
                            </div>

                        </div>
                    </div>
                    <div class="col-md-6 product-content-right">
                        <div class="product-content-right-product-name">
                            <h1>${product.name}</h1>

                        </div>
                        <div class="product-content-right-product-price">
                            <span>${Product.formatCurrency(product.getPrice())}</span>
                        </div>
                        <div class="product-content-right-product-color" data-index="option1">
                            <c:forEach var="p" items="${products}">
                                <a class="item-swatch" href="viewdetail?productId=${p.id}">
                                    <img src="${p.colorImage}" alt="50bks">
                                    <input type="hidden" name="color" value="${p.color}"/>
                                </a>
                            </c:forEach>


                        </div>
                        <input type="hidden" class="product-select" value="1112585377">
                        <c:if test="${not empty sizes}">
                            <div class="product-content-right-product-size">
                                <p>Size:</p>
                                <div class="size">
                                    <c:forEach var="size" items="${sizes}">
                                        <span>${size}</span>
                                        <input type="hidden" name="size" value="${size}" />
                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>

                        <div class="quantity">
                            <p>Số lượng:</p>
                            <input type="number" min="0" value="1">
                        </div>
                        <div class="choose-size">
                            <p style="color: red;">Vui lòng chọn size</p>
                            <span id="imageButton" onclick="displayImage()">
                                <i class="fas fa-ruler"></i>
                                <span id="sizeGuideText">Hướng dẫn kích thước</span>
                            </span>
                        </div>

                        <div class="product-content-right-product-button">
                            <button id="btn-addtocart"style="display: flex;justify-content: center;padding: 20px 10px;"><i class="fa-solid fa-cart-shopping"></i><p>THÊM VÀO GIỎ</p></button>
                            <button id="btn-buynow"style="display: flex;justify-content: center;padding: 20px 10px;"><i class="fa-solid fa-bag-shopping"></i><p>MUA NGAY</p></button>
                        </div>
                        <div class="product-content-right-bottom-content-big">
                            <div class="product-content-right-bottom-content-title row">
                                <div class="product-content-right-bottom-content-title-item chitiet">
                                    <p style="font-weight: bold;">THÔNG TIN SẢN PHẨM</p>
                                </div>
                            </div> 
                            <div class="product-content-right-bottom-content">
                                <div class="product-content-right-bottom-content-chitiet">
                                    ${product.description}<br>

                                    Giới tính: Unisex<br>
                                    Kiểu dáng: ${product.type}<br>
                                    Chất vải mềm mịn, thoáng mát <br>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--sản phẩm yêu thích-->
        <section class="product-relative container">
            <style>
                .product_active.owl-carousel .col-lg-3 {
                    min-width: 100%;
                    -webkit-box-flex: 1005;
                    -ms-flex: 1005;
                    flex: 1005;
                }
                .product_thumb {
                    position: relative;
                    overflow: hidden;
                    -webkit-transition: .3s;
                    transition: .3s;
                    position: relative
                }
                .owl-carousel .owl-item .product_thumb img {
                    width: 100%;
                }
                .product_thumb::before {
                    position: absolute;
                    content: "";
                    width: 100%;
                    height: 100%;
                    background: #009483;
                    opacity: 0;
                    cursor: pointer;
                    -webkit-transition: .3s;
                    transition: .3s;
                    pointer-events: none;
                }
                .single_product:hover .product_thumb::before {
                    opacity: 0.2;
                }
                .product_active.owl-carousel .img_icone img {
                    width: inherit;
                }
                .img_icone {
                    position: absolute;
                    top: 0;
                    left: 0;
                }
                .hot_img {
                    position: absolute;
                    top: 0;
                    right: 0;
                }
                .product_action {
                    position: absolute;
                    bottom: -15%;
                    width: 100%;
                    text-align: center;
                    -webkit-transition: .3s;
                    transition: .3s;
                    opacity: 0;
                    visibility: hidden;
                }
                .product_action a {
                    display: block;
                    background: #000000;
                    color: #fff;
                    padding: 7px 0;
                    text-transform: capitalize;
                    font-size: 13px;
                }
                .product_action a:hover{
                    background: #000000;
                }
                .single_product:hover .product_action{
                    bottom: 0;
                    opacity: 1;
                    visibility: visible;
                }
                .product_content h3 {
                    font-size: 14px;
                    color: #666;
                    font-weight: normal;
                    text-transform: uppercase;
                    margin-bottom: 0;
                }
                .product_content {
                    text-align: center;
                }
                .product_content span {
                    color: #333333;
                    font-weight: bold;
                    font-size: 18px;
                    padding: 7px 0;
                    display: block;
                }
                .product_content h3 a:hover{
                    color: #e84c3d;
                }
                .product_info ul li {
                    display: inline-block;
                }
                .product_info ul li a {
                    border: 1px solid #dbdbdb;
                    background: #fff;
                    color: #333333;
                    line-height: 30px;
                    padding: 2px 16px;
                    text-transform: capitalize;
                    display: block;
                    font-size: 13px;
                    margin: 0 3px;
                }
                .product_info {
                    text-align: center;
                    padding: 10px 0 5px;
                    opacity: 0;
                    visibility: hidden;
                    -webkit-transition: .3s;
                    transition: .3s;
                }
                .single_product:hover .product_info{
                    opacity: 1;
                    visibility: visible;
                }
                .product_info ul li.add a:hover{
                    background: #000000;
                    color: #fff;
                    border-color: #009483;
                }
                .product_info ul li.view a:hover{
                    background: #B01722;
                    color: #fff;
                    border-color: #009483;
                }
                .single_product {
                    border: 1px solid transparent;
                    padding: 8px;
                }
                .single_product:hover{
                    border: 1px solid #009483;
                }
                .single_p_active.owl-carousel .owl-nav div {
                    font-size: 20px;
                    width: 22px;
                    height: 22px;
                    background: #cccccc;
                    color: #fff;
                    text-align: center;
                    line-height: 22px;
                    -webkit-transition: 0.3s ease-in-out;
                    transition: 0.3s ease-in-out;
                }
                .brand_active {
                    padding-top: 12px;
                }
                .product_active.owl-carousel .owl-nav div.owl-prev {
                    right: 5px;
                    position: relative;
                }
                .single_p_active.owl-carousel .owl-nav {
                    position: absolute;
                    top: -34px;
                    right: 7px;
                    display: -webkit-box;
                    display: -ms-flexbox;
                    display: flex;
                    background: gray;
                    padding: 0px 10px;
                    justify-content: space-between;
                }
                .single_p_active.owl-carousel .owl-nav div:hover{
                    background-position: 100% 100%;
                    background-color: #333333;

                }
                .single_p_active.owl-carousel .owl-nav div.owl-next {
                    margin-left: 5px;
                }

                .block_title h3 {
                    color: #444444;
                    font-size: 18px;
                    font-weight: 700;
                    line-height: 14px;
                    margin-bottom: 15px;
                    display: inline-block;
                    background: #fff;
                    z-index: 9;
                    position: relative;
                    padding: 0px 10px;
                    font-family: 'Product sans'
                }
                .block_title h3 a {
                    line-height: 10px;
                }
                .block_title{
                    position: relative
                }
                .block_title h3 a:hover{
                    color: #e84c3d;
                }
                .block_title::before {
                    position: absolute;
                    content: "";
                    width: 100%;
                    height: 4px;
                    background: #F2F2F2;
                    right: 0;
                    top: 31%;
                    -webkit-transform: translatey(-50%);
                    transform: translatey(-50%);
                }
                .block_content p {
                    font-size: 13px;
                    color: #222;
                    line-height: 12px;
                }
                .block_content a {
                    text-transform: capitalize;
                    display: block;
                    text-align: right;
                    color: #222;
                    line-height: 12px;
                }
                .block_content a:hover{
                    color: #e84c3d;
                }

            </style>

            <div class="new_product_area product_page">
                <div class="row">
                    <div class="col-12">
                        <div class="block_title">
                            <h3>Có thể bạn cũng thích</h3>
                        </div>
                    </div> 
                </div>
                <div class="row">
                    <div class="single_p_active owl-carousel">
                        <div class="owl-nav">
                            <div class="owl-prev">
                                <i class="fa fa-angle-left">
                                </i>
                            </div>
                            <div class="owl-next">
                                <i class="fa fa-angle-right">
                                </i>
                            </div>
                        </div>
                        <div class="single_product">
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="https://product.hstatic.net/200000642007/product/50bks_3atsb0434_2_33d47d2a3d1944a8ab9e72c5201840a2_fb0911e2f579477cbb7f979f1611c335_large.jpg" alt=""></a> 
                                <div class="img_icone">
                                    <img src="assets/img/cart/newnho.png" alt="">
                                </div>
                                <div class="product_action">
                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </div>
                            </div>
                            <div class="product_content">
                                <span>790,000₫</span>
                                <del class="d-none">0₫</del>
                                <h3 class="product_title"><a href="single-product.html">Curabitur sodales</a></h3>
                            </div>
                            <div class="product_info">
                                <ul>
                                    <li class="add"><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                    <li class="view"><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View Detail</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="single_product">
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="https://product.hstatic.net/200000642007/product/50crs_3atsb0434_2_49fb9e9bf61e4aac9f6a19ea97e7985e_8ec7b4d3b07f4541addd8ef35182a368_large.jpg" alt=""></a> 
                                <div class="hot_img">
                                    <img src="assets\img\cart\span-hot.png" alt="">
                                </div>
                                <div class="product_action">
                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </div>
                            </div>
                            <div class="product_content">
                                <span>2,050,000₫</span>
                                <del class="d-none">0₫</del>
                                <h3 class="product_title"><a href="single-product.html">Quisque ornare dui</a></h3>
                            </div>
                            <div class="product_info">
                                <ul>
                                    <li class="add"><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                    <li class="view"><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View Detail</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="single_product">
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="https://product.hstatic.net/200000642007/product/50bks_3atsm1133_2_9e9e2c6d28da46cdb8bd71f1befa4e35_5798b0dc978a4238ba2be50f92b07365_large.jpg" alt=""></a> 
                                <div class="img_icone">
                                    <img src="assets/img/cart/newnho.png" alt="">
                                </div>
                                <div class="product_action">
                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </div>
                            </div>
                            <div class="product_content">
                                <span>1,790,000₫</span>
                                <del class="d-none">0₫</del>
                                <h3 class="product_title"><a href="single-product.html">Sed non turpiss</a></h3>
                            </div>
                            <div class="product_info">
                                <ul>
                                    <li class="add"><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                    <li class="view"><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View Detail</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="single_product">
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="https://product.hstatic.net/200000642007/product/50bks_3atsb0333_2_8f156e89e1ec4a50ba10dc7a78e9dd47_fabaab128aa04e4381ad4983e36816e3_large.jpg" alt=""></a> 
                                <div class="hot_img">
                                    <img src="assets\img\cart\span-hot.png" alt="">
                                </div>
                                <div class="product_action">
                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </div>
                            </div>
                            <div class="product_content">
                                <span>690,000₫</span>
                                <del class="d-none">0₫</del>
                                <h3 class="product_title"><a href="single-product.html">Duis convallis</a></h3>
                            </div>
                            <div class="product_info">
                                <ul>
                                    <li class="add"><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                    <li class="view"><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View Detail</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="single_product">
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="https://product.hstatic.net/200000642007/product/50bks_3atsb0534_2_d42fb7d6e4474113a09686ce43a7d448_3aebaa63767747b18981a9cb41293b57_large.jpg" alt=""></a> 
                                <div class="img_icone">
                                    <img src="assets/img/cart/newnho.png" alt="">
                                </div>
                                <div class="product_action">
                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </div>
                            </div>
                            <div class="product_content">
                                <span>2,790,000₫</span>
                                <del class="d-none">0₫</del>
                                <h3 class="product_title"><a href="single-product.html">Curabitur sodales</a></h3>
                            </div>
                            <div class="product_info">
                                <ul>
                                    <li class="add"><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                    <li class="view"><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View Detail</a></li>
                                </ul>
                            </div>
                        </div>
                    </div> 
                </div>      
            </div> 
            <!--new product area start-->  


            <!--new product area start-->
            <div class="new_product_area product_page">
                <div class="row">
                    <div class="col-12">
                        <div class="block_title">
                            <h3>Sản phẩm đã xem</h3>
                        </div>
                    </div> 
                </div>
                <div class="row">
                    <div class="single_p_active owl-carousel">
                        <div class="owl-nav">
                            <div class="owl-prev">
                                <i class="fa fa-angle-left">

                                </i>
                            </div>
                            <div class="owl-next">
                                <i class="fa fa-angle-right">

                                </i>
                            </div>
                        </div>

                        <div class="single_product">
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="https://product.hstatic.net/200000642007/product/50bks_3atsm1133_2_9e9e2c6d28da46cdb8bd71f1befa4e35_5798b0dc978a4238ba2be50f92b07365_large.jpg" alt=""></a> 
                                <div class="img_icone">
                                    <img src="assets/img/cart/newnho.png" alt="">
                                </div>
                                <div class="product_action">
                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </div>
                            </div>
                            <div class="product_content">
                                <span>1,790,000₫</span>
                                <del class="d-none">0₫</del>
                                <h3 class="product_title"><a href="single-product.html">Curabitur sodales</a></h3>
                            </div>
                            <div class="product_info">
                                <ul>
                                    <li class="add"><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                    <li class="view"><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View Detail</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="single_product">
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="https://product.hstatic.net/200000642007/product/50crs_3atse0434_2_df0c9810495b43dbb970e913197a7c63_e0879aec1cf74004b0284b545c91b4ec_large.jpg" alt=""></a> 
                                <div class="hot_img">
                                    <img src="assets\img\cart\span-hot.png" alt="">
                                </div>
                                <div class="product_action">
                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </div>
                            </div>
                            <div class="product_content">
                                <span>590,000₫</span>
                                <del class="d-none">0₫</del>
                                <h3 class="product_title"><a href="single-product.html">Quisque ornare dui</a></h3>
                            </div>
                            <div class="product_info">
                                <ul>
                                    <li class="add"><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                    <li class="view"><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View Detail</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="single_product">
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="https://product.hstatic.net/200000642007/product/43mgs_3atsb0434_2_b7aca0067d7045529ac96f0b30a86ee7_d10ed78f1aaa49e89e5103f2bf03eb1b_large.jpg" alt=""></a> 
                                <div class="img_icone">
                                    <img src="assets/img/cart/newnho.png" alt="">
                                </div>
                                <div class="product_action">
                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </div>
                            </div>
                            <div class="product_content">
                                <span>990,000₫</span>
                                <del class="d-none">0₫</del>
                                <h3 class="product_title"><a href="single-product.html">Sed non turpiss</a></h3>
                            </div>
                            <div class="product_info">
                                <ul>
                                    <li class="add"><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                    <li class="view"><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View Detail</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="single_product">
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="https://product.hstatic.net/200000642007/product/07crs_3lpqm0333_1_d6cd4d13de604e9fb4f274eadfd7a866_3c0a82977493493f9ee71ad8edc7ab52_master.jpg" alt=""></a> 
                                <div class="hot_img">
                                    <img src="assets\img\cart\span-hot.png" alt="">
                                </div>
                                <div class="product_action">
                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </div>
                            </div>
                            <div class="product_content">
                                <span>680,000₫</span>
                                <del class="d-none">0₫</del>
                                <h3 class="product_title"><a href="single-product.html">Duis convallis</a></h3>
                            </div>
                            <div class="product_info">
                                <ul>
                                    <li class="add"><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                    <li class="view"><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View Detail</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="single_product">
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="https://product.hstatic.net/200000642007/product/43ivs_3lpqb0133_1_b4ac972faacc4a3386328bf247a7ddb8_9d3d266b0efd401696b5cd75525dab66_master.jpg" alt=""></a> 
                                <div class="img_icone">
                                    <img src="assets/img/cart/newnho.png" alt="">
                                </div>
                                <div class="product_action">
                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </div>
                            </div>
                            <div class="product_content">
                                <span>500,000₫</span>
                                <del class="d-none">0₫</del>
                                <h3 class="product_title"><a href="single-product.html">Curabitur sodales</a></h3>
                            </div>
                            <div class="product_info">
                                <ul>
                                    <li class="add"><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                    <li class="view"><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View Detail</a></li>
                                </ul>
                            </div>
                        </div>
                    </div> 
                </div>      
            </div> 
        </section>
        <!--footer-->
        <%@ include file="footer.jsp" %>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const chitiet = document.querySelector(".chitiet");
                if (chitiet) {
                    chitiet.addEventListener("click", function () {
                        document.querySelector(".product-content-right-bottom-content-chitiet").style.display = "block";
                    });
                }
            });
            document.addEventListener("DOMContentLoaded", function () {
                const butTon = document.querySelector(".product-content-right-bottom-top");
                if (butTon) {
                    butTon.addEventListener("click", function () {
                        document.querySelector(".product-content-right-bottom-content-big").classList.toggle("activeB");
                    });
                }
            });
            document.addEventListener("DOMContentLoaded", function () {
                const colorSwatches = document.querySelectorAll(".item-swatch");
                colorSwatches.forEach(function (swatch) {
                    swatch.addEventListener("click", function () {
                        colorSwatches.forEach(function (swatch) {
                            swatch.classList.remove("active");
                        });
                        this.classList.add("active");
                    });
                });
            });
            document.addEventListener("DOMContentLoaded", function () {
                const sizeOptions = document.querySelectorAll(".size span");
                sizeOptions.forEach(function (size) {
                    size.addEventListener("click", function () {
                        // Remove "active" class from all size options
                        sizeOptions.forEach(function (size) {
                            size.classList.remove("active");
                        });
                        // Add "active" class to the clicked size option
                        this.classList.add("active");
                    });
                });
            });
            function displayImage() {
                var sizeGuideText = document.getElementById('sizeGuideText');
                if (sizeGuideText.innerHTML === 'Hướng dẫn kích thước') {
                    sizeGuideText.innerHTML = '<img src="assets/img/cart/anhchonsize.webp" alt="Size Guide">';
                } else {
                    sizeGuideText.innerHTML = 'Hướng dẫn kích thước';
                }
            }
            $(document).ready(function () {
                $(".single_p_active").owlCarousel({
                    loop: true,
                    margin: 20,
                    autoplay: true,
                    autoplayTimeout: 3000,
                    autoplayHoverPause: true,
                    nav: true,
                    dots: false,
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 2
                        },
                        1000: {
                            items: 3
                        },
                        1200: {
                            items: 4
                        }
                    }

                });
            });
        </script>
    </body>
</html>


