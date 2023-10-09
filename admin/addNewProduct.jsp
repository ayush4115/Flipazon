<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>


form{

padding-left: 140px;

}

hr{
margin-left: 43px;


}

.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: #212121;
   color:black;
   text-align: center;
}
</style>

</head>
<body>

<% 
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<%
int id=1;
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(id) from product");
while(rs.next())
{
	id=rs.getInt(1);
	id=id+1;
}
}
catch(Exception e)
{}
%>
<form style="background-color: #9bf1fd" action="addNewProductAction.jsp" method="post">
<center>
<br>
<h3 style="color: green;">Product ID: <%out.println(id); %> </h3>
<input type="hidden" name="id" value="<%out.println(id); %>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" placeholder="Enter Category" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" placeholder="Enter Price" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
   <select class="input-style" name="active">
   <option value="Yes">Yes</option>
   <option value="No">No</option>
   </select>
<hr>
</div>
<br>
 <button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
<br>
<br>
</center>
</form>
</body>
<br><br><br>
 <div class="footer" style="color:white;">
          <p >&#169; 2023-2024 Flipazon. All Rights Reserved.</p>
      </div>
</body>

</html>