<%@page import="dao.ProductDAOImpl" %>
<%@page import="model.Product" %>
<%@page import="model.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	ProductDAOImpl productDAO = new ProductDAOImpl();
	String category_id = request.getParameter("category_id");
	Cart cart = (Cart) session.getAttribute("cart");
	if(cart==null){
		cart = new Cart();
		session.setAttribute("cart",cart);
	}
%>

<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">San pham <%=category_id %></h2>
						<%
						if(category_id==null){
						for(Product list:productDAO.getListProduct()){ 
						%>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="images/home/product1.jpg" alt="" />
											<h2><%=list.getPrice() %></h2>
											<p><%=list.getName() %></p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
												<h2><%=list.getPrice() %></h2>
											<p><%=list.getName() %></p>
												<a href="CartServlet?command=insertItem&product_id=<%=list.getProduct_id() %>&cartID=<%=System.currentTimeMillis() %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
											</div>
										</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="detail.jsp?product_id=<%=list.getProduct_id()%>"><i class="fa fa-plus-square"></i>Xem chi tiet</a></li>
									</ul>
								</div>
							</div>
						</div>
						<%
						}
						}else{
							for(Product sp:productDAO.getListproductByCategory(Integer.parseInt(category_id))){
						%>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="images/home/product1.jpg" alt="" />
											<h2><%=sp.getPrice() %></h2>
											<p><%=sp.getName() %></p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
												<h2><%=sp.getPrice() %></h2>
												<p><%=sp.getName() %></p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
											</div>
										</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="detail.jsp?product_id=<%=sp.getProduct_id()%>"><i class="fa fa-plus-square"></i>Xem chi tiet</a></li>
									</ul>
								</div>
							</div>

						
				
					</div>
					<%}} %>
					</div>
					</div>
					</body>
</html>