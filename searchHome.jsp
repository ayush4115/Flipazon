<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>

tr:hover {background-color: deepskyblue;}
</style>

</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Home <i class="fa-solid fa-house"></i></div>

<%
  String msg=request.getParameter("msg");
  if("added".equals(msg))
  {
  %>
<h3 class="alert">Product added successfully!</h3>
<%} %>
<%
if("exist".equals(msg))
{
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
	%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
 <%
 int z=0;
 	try
       {
 		String search=request.getParameter("search");
 		Connection con=ConnectionProvider.getCon();
 		Statement st=con.createStatement();
 		ResultSet rs=st.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes'");
 		while(rs.next())
 		{
 		z=1;	
 		
       %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4)%></i></td>
            <td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
         <%
 		}}
 	catch(Exception e){
 		System.out.println(e);
 	}
         %>
        </tbody>
      </table>
      	<%if(z==0){ %>
	<h1 style="color:mediumaquamarine; text-align: center;">Nothing to show</h1>
	<%} %>
      <br>
      <br>
      <br>
      <div class="footer" style="color:white;">
          <p >&#169; 2023-2024 Flipazon. All Rights Reserved.</p>
      </div>

</body>
</html>