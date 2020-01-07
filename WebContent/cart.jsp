<%@page import = "model.Cart" %>
<%@page import = "model.Product" %>
<%@page import ="java.util.TreeMap" %>
<%@page import ="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	 <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</head>
<body>
<%
Cart cart = (Cart) session.getAttribute("cart");
if(cart==null){
	cart = new Cart();
	session.setAttribute("cart",cart);
}
TreeMap<Product,Integer> list = cart.getListProduct();
%>
<jsp:include page="header.jsp"></jsp:include>

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Tên Sản phẩm</td>
							<td class="description"></td>
							<td class="price">Giá bán</td>
							<td class="quantity">Số lượng</td>
							<td class="total">Thành tiền</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
					<%for(Map.Entry<Product,Integer> entry: list.entrySet()){ %>
						<tr>
							<td class="cart_product">
								<a href=""><img src="images/cart/cart-imgbook.jpg" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href=""><%=entry.getKey().getName() %></a></h4>
								<p>Mã sản phẩm: <%=entry.getKey().getProduct_id() %></p>
							</td>
							<td class="cart_price">
								<p><%=entry.getKey().getPrice() %></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href="CartServlet?command=addItem&product_id=<%=entry.getKey().getProduct_id() %>&cartID=<%=System.currentTimeMillis() %>"> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="<%=entry.getValue() %>" autocomplete="off" size="2" disabled="disabled">
									<a class="cart_quantity_down" href="CartServlet?command=subItem&product_id=<%=entry.getKey().getProduct_id() %>&cartID=<%=System.currentTimeMillis() %>"> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price"><%=entry.getValue() * entry.getKey().getPrice() %></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href="CartServlet?command=removeItem&product_id=<%=entry.getKey().getProduct_id() %>&cartID=<%=System.currentTimeMillis() %>"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<%} %>
						<tr>
							<td>
							<a class ="btn btn-default update" href="index.jsp">Tiếp tục mua hàng</a>
							<a class ="btn btn-default update" href="CartServlet?command=cancelItem %>">Hủy đơn hàng</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->
	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>What would you like to do next?</h3>
				<p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="chose_area">
						<ul class="user_option">
							<li>
								<input type="checkbox">
								<label>Use Coupon Code</label>
							</li>
							<li>
								<input type="checkbox">
								<label>Use Gift Voucher</label>
							</li>
							<li>
								<input type="checkbox">
								<label>Estimate Shipping & Taxes</label>
							</li>
						</ul>
						<ul class="user_info">
							<li class="single_field">
								<label>Country:</label>
								<select>
									<option>United States</option>
									<option>Bangladesh</option>
									<option>UK</option>
									<option>India</option>
									<option>Pakistan</option>
									<option>Ucrane</option>
									<option>Canada</option>
									<option>Dubai</option>
								</select>
								
							</li>
							<li class="single_field">
								<label>Region / State:</label>
								<select>
									<option>Select</option>
									<option>Dhaka</option>
									<option>London</option>
									<option>Dillih</option>
									<option>Lahore</option>
									<option>Alaska</option>
									<option>Canada</option>
									<option>Dubai</option>
								</select>
							
							</li>
							<li class="single_field zip-field">
								<label>Zip Code:</label>
								<input type="text">
							</li>
						</ul>
						<a class="btn btn-default update" href="">Get Quotes</a>
						<a class="btn btn-default check_out" href="">Continue</a>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>Cart Sub Total <span>$59</span></li>
							<li>Eco Tax <span>$2</span></li>
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span>$61</span></li>
						</ul>
							<a class="btn btn-default update" href="">Update</a>
							<a class="btn btn-default check_out" href="">Check Out</a>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>