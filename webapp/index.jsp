<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.fooddelivery.model.User" %>
<%
    // Redirect to register if user not logged in
    User user = (User) session.getAttribute("loggedUser");
    if(user == null){
        response.sendRedirect("register.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Food Delivery App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f7f7f7; }
        .hero { 
            background: url('https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=1350&q=80') 
            no-repeat center center; background-size: cover; height: 80vh; 
            display: flex; align-items: center; justify-content: center; color: white; text-shadow: 2px 2px 8px #000;
        }
        .hero h1 { font-size: 4rem; font-weight: bold; }
        .hero p { font-size: 1.5rem; }
        .btn-primary { background-color: #ff4c3b; border: none; }
        .btn-primary:hover { background-color: #e84331; }
        .features .card { transition: transform 0.3s, box-shadow 0.3s; }
        .features .card:hover { transform: translateY(-10px); box-shadow: 0 8px 25px rgba(0,0,0,0.2); }
    </style>
</head>
<body>

<!-- Hero Section -->
<section class="hero text-center">
    <div>
        <h1>Welcome, <%= user.getName() %>!</h1>
        <p>Delicious food delivered fast & fresh!</p>
        <a href="<%= request.getContextPath() %>/resturants" class="btn btn-primary btn-lg mt-3">View Restaurants</a>
    </div>
</section>

<!-- Features Section -->
<section class="features py-5">
    <div class="container">
        <h2 class="text-center mb-5">Why Choose Us?</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <div class="card-body">
                        <i class="bi bi-speedometer2 display-4 mb-3" style="color:#ff4c3b;"></i>
                        <h5 class="card-title">Fast Delivery</h5>
                        <p class="card-text">Get your food delivered hot & fresh in record time.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <div class="card-body">
                        <i class="bi bi-emoji-smile display-4 mb-3" style="color:#ff4c3b;"></i>
                        <h5 class="card-title">Fresh & Tasty</h5>
                        <p class="card-text">Our food is prepared with quality ingredients you can trust.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <div class="card-body">
                        <i class="bi bi-cart-check display-4 mb-3" style="color:#ff4c3b;"></i>
                        <h5 class="card-title">Easy Ordering</h5>
                        <p class="card-text">Browse menus, add to cart, and place orders in just a few clicks.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    &copy; 2026 Food Delivery App | All Rights Reserved
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
body