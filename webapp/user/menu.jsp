<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.FoodItem" %>

<%
    // Session check
    if (session.getAttribute("loggedUser") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    // Data from servlet
    List<FoodItem> foodList = (List<FoodItem>) request.getAttribute("foodList");
    Integer resturantId = (Integer) request.getAttribute("resturantId");

    if (foodList == null || resturantId == null) {
        out.println("No menu data available");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Food Menu</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            transition: 0.3s;
            border-radius: 15px;
        }
        .card:hover {
            transform: scale(1.04);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        .card img {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
    </style>
</head>

<body>

<div class="container mt-4">

    <h2 class="text-center mb-4">🍽 Food Menu</h2>

    <div class="row">

        <%
            if (foodList.isEmpty()) {
        %>
            <div class="col-12 text-center text-danger">
                No food items available
            </div>
        <%
            }

            for (FoodItem item : foodList) {
        %>

        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="<%= request.getContextPath() %>/images/food.jpg"
                     class="card-img-top" height="200">

                <div class="card-body text-center">
                    <h5 class="card-title"><%= item.getName() %></h5>
                    <p class="card-text fw-bold text-success">
                        ₹ <%= item.getPrice() %>
                    </p>

                    <!-- Add to Cart -->
                    <form action="<%= request.getContextPath() %>/addToCart" method="post">
                        <input type="hidden" name="foodId" value="<%= item.getFoodId() %>">
                        <input type="hidden" name="name" value="<%= item.getName() %>">
                        <input type="hidden" name="price" value="<%= item.getPrice() %>">

                        <button type="submit" class="btn btn-success w-100">
                            Add to Cart
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <%
            }
        %>

    </div>

    <div class="text-center mt-3">
        <a href="<%= request.getContextPath() %>/cart.jsp"
           class="btn btn-primary">
            🛒 View Cart
        </a>
    </div>

</div>

</body>
</html>

