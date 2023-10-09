<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">


<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
    <input type="text" name="name" placeholder="Enter Name" required>
       <input type="email" name="email" placeholder="Enter Email" required>
          <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
          <select name="securityQuestion" required>
          <option value="What was your first car?">
          What was your first car?
          </option>
           <option value="What is the name of your first pet?">
          What is the name of your first pet?
          </option>
           <option value="What elementary school did you attend?">
          What elementary school did you attend?
          </option>
           <option value="What is the name of the town where you were born?">
          What is the name of the town where you were born?
          </option>
          </select>
          <input type="text" name="answer" placeholder="Enter Answer" required>
          <input type="password" name="password" placeholder="Enter password" required>
<input type="submit" name="signup">
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
	%>
	<h1 style="color:green"> Successfully Registered !</h1>
	<%}%>
	<%
	if("invalid".equals(msg))
{
	%>
	<h1> Some Things Went Wrong Try Again !</h1>
	<%}%>


    <h2>Flipazon</h2>

<p>The Flipazon is the application that allows the users to shop online without going to the shops to buy them.<br><br>we make shopping easy and convenient. You can buy everything you need right from your home.
    </p>  </div>
</div>

</body>
</html>