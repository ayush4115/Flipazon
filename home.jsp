<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<html>
<head>

<script>

sessionStorage.setItem('selectedNavItemIndex', 0);
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: green;
	text-align: center;
}
.table-container{
overflow-y: auto;
max-height:535px;
}
table{
width:100%;
border-collapse: collapse;
}

thead{
position: sticky;
top:0;
background-color: #f9f9f9;
}

th{
font-weight:bold;
padding:10px;
}

tr:hover
{
background-color: deepskyblue;
}


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
<div class="table-container">
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
 	try
       {
 		Connection con=ConnectionProvider.getCon();
 		Statement st=con.createStatement();
 		ResultSet rs=st.executeQuery("select * from product where active='Yes'");
 		while(rs.next())
 		{
       %>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4)%></td>
            <td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
<%
 		}
       }
  catch(Exception e)
  {
	  System.out.println(e);
  }
%>
        </tbody>
        </div>
      </table>
      <br>
      <br>
      <br>

</body>
</html>