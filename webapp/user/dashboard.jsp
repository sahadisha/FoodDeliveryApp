<%@ page import="com.fooddelivery.model.User" %>
<%
    User user = (User) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand">Food Delivery</span>
    <span class="text-white">Hello, <%= user.getName() %></span>
</nav>

<div class="container mt-5 text-center">
    <h2>Hungry? Let’s Order 😋</h2>
    <a href="../resturants" class="btn btn-success mt-3 px-4">
        View Resturants
    </a>
</div>

</body>
</html>
