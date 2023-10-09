<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>
    .nav-item {
        display: inline-block;
        padding: 10px 16px;
        border-radius: 18px 18px 0 0; /* Make it oval-shaped */
        cursor: pointer;
        box-shadow: 0 2px 5px rgba(33, 33, 33, 0.2);
        transition: background-color 0.0s ease, color 0.0s ease;
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
    <center>
        <h1 style="color:white">Change Details <i class="fa fa-edit"></i></h1>
    </center>
    <%String email=session.getAttribute("email").toString(); %>
   
   
   
<%
session.removeAttribute("selectedNavItemIndex");
%>
   
    <br>
    <%-- Check if the current page is the home page, and if so, add the 'clicked' class --%>
    <h2><a href="home.jsp" <% 
    if (request.getRequestURI().endsWith("home.jsp")) 
    { %>class="nav-item clicked" <% } else
    { %>class="nav-item" <% } %> >
    <i class='fas fa-arrow-circle-left'> Back</i></a></h2>
    
<a href="changeDetails.jsp" <% 
    if (request.getRequestURI().endsWith("changeDetails.jsp")) 
    { %>class="nav-item clicked" <% } else
    { %>class="nav-item" <% } %> >Account Details <i class="fa fa-edit"></i></a>
   
   
    <a href="changePassword.jsp" class="nav-item" data-index="0">Change Password <i class='fas fa-key'></i></a>
    <a href="addChangeAddress.jsp" class="nav-item" data-index="3">Add or change Address <i class='fas fa-map-marker-alt'></i></a>
    <a href="changeSecurityQuestion.jsp" class="nav-item" data-index="2">Change Security Question <i class="fa fa-repeat"></i></a>
    <a href="changeMobileNumber.jsp" class="nav-item" data-index="4">Change Mobile Number <i class='fas fa-phone'></i></a>
</div>
<br>
<!--table-->

<script>
    // JavaScript function to set and get the selected index from sessionStorage
    document.addEventListener('DOMContentLoaded', function() {
        var navItems = document.querySelectorAll('.nav-item');

        // Get the selected index from sessionStorage
        var selectedIndex = sessionStorage.getItem('selectedNavItemIndex');

        // If a selected index is found, apply 'clicked' class to the corresponding nav item
        if (selectedIndex !== null) {
            navItems[selectedIndex].classList.add('clicked');
        } else {
            // If no selected index found, add 'clicked' class to the 'Account Details' link on the home page
            if (window.location.pathname.endsWith('home.jsp')) {
                navItems[1].classList.add('clicked');
            }
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