<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="css/home-style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <style>
    form {
      padding-right: 200px;
    }
    
    .abc{
     display: inline-block;
      padding: 10px 16px;
      border-radius: 18px 18px 0 0; /* Make it oval-shaped */
      cursor: pointer;
      
      box-shadow:0 2px 5px rgba(33, 33, 33, 0.2);
      transition : background-color 0.0s ease, color 0.0s ease;
    
    }

    /* Default background color */
    .nav-item {
      display: inline-block;
      padding: 10px 16px;
      border-radius: 18px 18px 0 0; /* Make it oval-shaped */
      cursor: pointer;
      
      box-shadow:0 2px 5px rgba(33, 33, 33, 0.2);
      transition : background-color 0.0s ease, color 0.0s ease;
      
    }

    /* Blue background color for clicked item */
    .nav-item.clicked {
      background-color: white;
      color: black; /* Set text color for better contrast */
    }
  </style>
</head>

<!--Header-->

<div class="topnav sticky">
  <% String email = session.getAttribute("email").toString(); %>
  <center>
    <img src="img/hdd.jpg">           
  </center>

  <h2><a><i class="fa-solid fa-user fa-xl"></i> <% out.println(email); %></a></h2>
  <br><br>
  <br>

  <a href="home.jsp" class="nav-item" data-index="0">Home <i class="fa-solid fa-house"></i></a>
  <a href="myCart.jsp" class="nav-item" data-index="1">My Cart <i class='fas fa-cart-arrow-down'></i></a>
  <a href="myOrders.jsp" class="nav-item" data-index="2">My Orders <i class='fab fa-elementor'></i></a>
  
 <a href="changeDetails.jsp" class="abc" >
    Change Details <i class="fa fa-edit"></i></a>
  
  
  <a href="messageUs.jsp" class="nav-item" data-index="4">Message Us <i class="fa-solid fa-message"></i></a>
  <a href="about.jsp" class="nav-item" data-index="5">About <i class="fa-solid fa-users"></i></a>
  <a href="privacy.jsp" class="nav-item" data-index="6">Privacy Policy <i class="fa-solid fa-shield-halved"></i></a>
  <a href="logout.jsp" class="nav-item" data-index="7">Logout <i class="fa-solid fa-right-to-bracket"></i></a>
  <!-- Add data-index attribute to other header items if needed -->
  
  <div class="search-container">
    <form action="searchHome.jsp" method="post">
      <input type="text" placeholder="Search" name="search">
      <button type="submit"><i class="fa fa-search"></i></button>
    </form>
  </div>
</div>
<br>
<!--table-->

<script>
  // JavaScript function to set and get the selected index from sessionStorage
  document.addEventListener('DOMContentLoaded', function()
		  {
    var navItems = document.querySelectorAll('.nav-item');

    // Get the selected index from sessionStorage
    var selectedIndex = sessionStorage.getItem('selectedNavItemIndex');

    // If a selected index is found, apply 'clicked' class to the corresponding nav item
    if (selectedIndex !== null) {
      navItems[selectedIndex].classList.add('clicked');
    }

    // Add click event listeners to each nav item
    for (var i = 0; i < navItems.length; i++) {
      navItems[i].addEventListener('click', function() {
        // Remove 'clicked' class from all nav items
        for (var j = 0; j < navItems.length; j++) {
          navItems[j].classList.remove('clicked');
        }

        // Add 'clicked' class to the clicked nav item
        this.classList.add('clicked');

        // Get the index of the clicked item and store it in sessionStorage
        var selectedIndex = Array.from(navItems).indexOf(this);
        sessionStorage.setItem('selectedNavItemIndex', selectedIndex);
      });
    }
  });
</script>

</html>