<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="../css/home-style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <style>
    form {
      padding-right: 200px;
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
    <h2 style="color:white">Flipazon (admin)</h2>
  </center>

  <a href="addNewProduct.jsp" class="nav-item" data-index="0">Add New Product <i class='fas fa-plus-square'></i></a>
  <a href="allProductEditProduct.jsp" class="nav-item" data-index="1">All Products & Edit Products <i class='fab fa-elementor'></i></a>
  <a href="messagesReceived.jsp" class="nav-item" data-index="2">Messages Received <i class='fas fa-comment-alt'></i></a>
  <a href="ordersReceived.jsp" class="nav-item" data-index="3">Orders Received <i class="fas fa-archive"></i></a>
  <a href="cancelOrders.jsp" class="nav-item" data-index="4">Cancel Orders <i class='fas fa-window-close'></i></a>
  <a href="deliveredOrders.jsp" class="nav-item" data-index="5">Delivered Orders <i class='fas fa-dolly'></i></a>
  <a href="../logout.jsp" class="nav-item" data-index="6">Logout <i class='fas fa-share-square'></i></a>
</div>
<br>
<!--table-->

<script>
  // JavaScript function to set and get the selected index from local storage
  document.addEventListener('DOMContentLoaded', function() {
    var navItems = document.querySelectorAll('.nav-item');

    // Get the selected index from local storage
    var selectedIndex = localStorage.getItem('selectedNavItemIndex');

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

        // Get the index of the clicked item and store it in local storage
        var selectedIndex = Array.from(navItems).indexOf(this);
        localStorage.setItem('selectedNavItemIndex', selectedIndex);
      });
    }
  });
</script>

</html>