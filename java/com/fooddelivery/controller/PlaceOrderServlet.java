package com.fooddelivery.controller;

import com.fooddelivery.model.User;
import com.fooddelivery.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedUser");

        if(user == null){
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();
            String sqlOrder = "INSERT INTO orders(user_id,total_amount) VALUES(?,?)";
            PreparedStatement psOrder = con.prepareStatement(sqlOrder);
            psOrder.setInt(1, user.getId());  // fixed
            psOrder.setDouble(2, Double.parseDouble(request.getParameter("totalAmount")));
            psOrder.executeUpdate();

            response.sendRedirect("orderSuccess.jsp");

        } catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("cart.jsp?error=OrderFailed");
        }
    }
}
