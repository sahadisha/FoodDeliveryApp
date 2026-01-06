<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.CartItem" %>

<%
    // Session check
    if (session.getAttribute("loggedUser") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    double totalAmount = 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart | Food Delivery</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f7f7f7;
        }
        .btn-primary {
            background-color: #ff4c3b;
            border: none;
        }
        .btn-primary:hover {
            background-color: #e84331;
        }
        .table {
            background-color: white;
        }
    </style>
</head>

<body>

<div class="container mt-5">
    <h2 class="mb-4 text-center">🛒 Your Cart</h2>

    <%
        if (cart == null || cart.isEmpty()) {
    %>
        <div class="alert alert-warning text-center">
            Your cart is empty
        </div>
        <div class="text-center">
            <a href="../resturants.jsp" class="btn btn-secondary">
                Browse Restaurants
            </a>
        </div>
    <%
        } else {
    %>

    <table class="table table-bordered">
        <thead class="table-dark">
        <tr>
            <th>Food Name</th>
            <th>Price (₹)</th>
            <th>Quantity</th>
            <th>Total (₹)</th>
        </tr>
        </thead>

        <tbody>
        <%
            for (CartItem item : cart) {
                totalAmount += item.getTotal();
        %>
            <tr>
                <td><%= item.getName() %></td>
                <td><%= item.getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td><%= item.getTotal() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <h4 class="text-end mt-3">
        Total Amount: ₹ <%= totalAmount %>
    </h4>

    <div class="d-flex justify-content-between mt-4">
        <a href="../resturants.jsp" class="btn btn-outline-secondary">
            ← Add More Items
        </a>

        <form action="<%= request.getContextPath() %>/placeOrder" method="post">
            <button type="submit" class="btn btn-primary">
                Place Order
            </button>
        </form>
    </div>

    <%
        }
    %>
</div>

</body>
</html>
