<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<html>
<head>


<script>

sessionStorage.setItem('selectedNavItemIndex', 1);
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: green;
	text-align: center;
}

tr:hover
{
background-color: deepskyblue;
}


.blinking-sentence {
      display: inline-block;
      overflow: hidden;
    }

    .blinking-sentence span {
      display: inline-block;
      animation: blink-words 4s infinite; /* Increased the animation duration to 4 seconds */
    }

    @keyframes blink-words {
      0%, 100% {
        opacity: 0;
      }
      50% {
        opacity: 1;
      }
    }

    /* Adjust the animation-delay for each word */
    .blinking-sentence span:nth-child(1) {
      animation-delay: 0.1s;
    }

    .blinking-sentence span:nth-child(2) {
      animation-delay: 0.3s; /* Increased the delay to 1 second */
    }

    .blinking-sentence span:nth-child(3) {
      animation-delay: 0.5s; /* Increased the delay to 2 seconds */
    }
    
     .blinking-sentence span:nth-child(4) {
      animation-delay: 0.7s; /* Increased the delay to 2 seconds */
    } 
    .blinking-sentence span:nth-child(5) {
      animation-delay: 0.9s; /* Increased the delay to 2 seconds */
    }
    
     .blinking-sentence span:nth-child(6) {
      animation-delay: 1.1s; /* Increased the delay to 2 seconds */
    } 
    
     .blinking-sentence span:nth-child(7) {
      animation-delay: 90s; /* Increased the delay to 2 seconds */
    }  
   

</style>
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
  String msg=request.getParameter("msg");
  if("notPossible".equals(msg))
  {
  %>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<%
if("dec".equals(msg))
{
	%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<%
if("removed".equals(msg))
{
	%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<table>
<thead>
<%
int total=0;
int sno=0;

 	try
       {
 		Connection con=ConnectionProvider.getCon();
 		Statement st=con.createStatement();
 		ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
 		while(rs1.next())
 		{
 			total=rs1.getInt(1);
 		}
       %>
          <tr>
            <th scope="col" style="background-color:mediumaquamarine ;">Total: <i class="fa fa-inr"></i> <% out.println(total); %></th>
           <%if(total>0){ %> <th style="background-color:aquamarine ;" scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs=st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
        while(rs.next())
        {
        %>
      
        
        <tr>
		<%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %> </td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%=rs.getString(8) %>  <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(10) %></td>
            <td><a href="removeFromCart.jsp?id=<%=rs.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%
   }
       if(total==0)
       {
    	   %>
    	    </tbody>
      </table>
      <br>
    	   <h2 style="color:#212121; text-align: center;">
    	   
    	   <div class="blinking-sentence">
    <span>Your</span>
    <span>Flipazon</span>
    <span>Cart</span>
    <span><i class='fas fa-cart-arrow-down'></i></span>
    <span>is</span>
    <span>empty</span>
   <span> </span>
  </div>
  </h2>
    	   
    	   <% 
       }
       
       }
 	catch(Exception e)
 	{
 		System.out.println(e);
 	}
 	%>
       
      <br>
      <br>
      <br>

</body>
</html>