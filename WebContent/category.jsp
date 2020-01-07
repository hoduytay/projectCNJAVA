<%@page import="dao.CategoryDAOImpl" %>
<%@page import="model.Category" %>
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
	CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
%>

<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Danh Mục</h2>
						<div class="panel-group category-products" id="accordian">
						<!--category-productsr-->
							<%
							for (Category list : categoryDAO.getCategoryByParent()){
							%>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span><%= list.getName() %>
										</a>
									</h4>
								</div>
								<% if(categoryDAO.getCategoryByChildren(list.getCategory_id()).size()>0){ %>
								
									<div class="panel-body">
										<ul>
											<%for(Category c2:categoryDAO.getCategoryByChildren(list.getCategory_id())){ %>
											<li><a href="index.jsp?category_id=<%=c2.getCategory_id()%>"><%=c2.getName() %></a></li>
											<%} %>
										</ul>
									</div>

								</div>
								<%} %>
							</div>
							<% } %>
						</div><!--/category-products-->
					
					
						
						
					</div>
		
</body>
</html>