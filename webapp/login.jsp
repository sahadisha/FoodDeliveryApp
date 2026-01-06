<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | Food Delivery</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
            font-family: 'Segoe UI', sans-serif;
        }
        .form-container {
            max-width: 400px;
            margin: 80px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        .btn-primary {
            background-color: #ff4c3b;
            border: none;
        }
        .btn-primary:hover {
            background-color: #e84331;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2 class="text-center mb-4">Login</h2>

    <!-- Display error if exists -->
    <%
        String error = (String) request.getAttribute("error");
        if(error != null){
    %>
        <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <form action="<%= request.getContextPath() %>/login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" name="email" id="email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" name="password" id="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>

    <p class="mt-3 text-center">
        Don't have an account? <a href="<%= request.getContextPath() %>/register.jsp">Register here</a>
    </p>
</div>
</body>
</html>
