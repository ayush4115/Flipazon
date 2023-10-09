<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<script>

sessionStorage.setItem('selectedNavItemIndex', 1);
</script>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr
{
width:36%;
}

body{
 background-color:white;}
 form{
 background-color:#9bf1fd;}
 
 }

</style>
</head>
<body>

 <%
 	try
       {
 		Connection con=ConnectionProvider.getCon();
 		Statement st=con.createStatement();
 		ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
 		while(rs.next())
 		{
       %>
         <center>
         <h2 style="margin-top:-1px; margin-bottom:5.5px;">Account Details</h2>
                 </center>
      
       <form>
     
<h3>Name:</h3><center><h3 style=" background-color:white; width:36%; padding-top:10px;padding-bottom:10px; margin-top:-13px;"> <%=rs.getString(1) %></h3></center>
<hr>
 <h3>Email:</h3><center><h3 style=" background-color:white; width:36%; padding-top:10px;padding-bottom:10px;  margin-top:-13px;"> <%=rs.getString(2) %></h3></center>
 <hr>
 <h3>Mobile Number:</h3><center><h3 style=" background-color:white; width:36%; padding-top:10px;padding-bottom:10px;  margin-top:-13px;"> <%=rs.getString(3) %></h3></center>
 <hr>
<h3>Security Question:</h3><center><h3 style=" background-color:white; width:36%; padding-top:10px;padding-bottom:10px;  margin-top:-13px;"> <%=rs.getString(4) %></h3></center>

</form>
    
<%}
 		}
 		catch(Exception e)
 		{
 			System.out.println(e);
 		}%>
</body>
</html>