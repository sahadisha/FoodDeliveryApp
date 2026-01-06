<%
    String orderId = request.getParameter("orderId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Success | Food Delivery</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f7f7f7; }
        .btn-success { background-color: #28a745; border: none; }
        .btn-success:hover { background-color: #218838; }
    </style>
</head>
<body>
<div class="container mt-5 text-center">
    <h2 class="mb-4">🎉 Your order has been placed successfully!</h2>
    <p>Order ID: <strong><%= orderId %></strong></p>
    <a href="../index.jsp" class="btn btn-success mt-3">Back to Restaurants</a>
</div>
</body>
</html>
