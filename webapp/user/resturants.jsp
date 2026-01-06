<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.Resturant" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Restaurants | Food Delivery</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f7f7f7; }
        .card { transition: transform 0.3s, box-shadow 0.3s; }
        .card:hover { transform: translateY(-5px); box-shadow: 0 8px 25px rgba(0,0,0,0.2);}
        .card img { height: 150px; object-fit: cover; }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Available Restaurants</h2>
    <div class="row g-4">
        <%
            List<Resturant> list = (List<Resturant>) request.getAttribute("resturantList");
            for(Resturant r: list){
        %>
        <div class="col-md-4">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=600&q=80" class="card-img-top">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= r.getName() %></h5>
                    <p class="card-text"><%= r.getLocation() %></p>
                    <a href="menu?resturantId=<%= r.getResturantId() %>" class="btn btn-primary">View Menu</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
