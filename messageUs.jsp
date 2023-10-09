<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<html>
<head>


<script>

sessionStorage.setItem('selectedNavItemIndex', 3);
</script>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>

</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>

<%
  String msg=request.getParameter("msg");
  if("valid".equals(msg))
  {
  %>
<h3 style="text-align:center; color:green;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 style="text-align:center; color:green;">Some thing Went Wrong! Try Again!</h3>
<%} %>
<br>
<form style="background-color: #9bf1fd;" action="messageUsAction.jsp" method="post">
<br>
<input class="input-style" name="subject" type="text" placeholder="subject" required>
<br><br>
<textarea class="input-style" name="body" placeholder="Enter Your Message" required></textarea>
<br>
<button class="button" type="submit">Send<i class="far fa-arrow-all-circle-right"></i></button>
<br><br>
</form>
<br><br><br>
</body>
</html>














