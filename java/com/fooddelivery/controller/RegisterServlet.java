package com.fooddelivery.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.fooddelivery.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // 1️⃣ Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // 2️⃣ Validate basic input (optional)
        if(name == null || email == null || password == null ||
           name.isEmpty() || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "All fields are required!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // 3️⃣ Insert data into DB
        try {
            Connection con = DBConnection.getConnection(); // your DBConnection class
            String sql = "INSERT INTO users(name,email,password) VALUES(?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);

            int row = pst.executeUpdate();

            if(row > 0){
                // ✅ Successful registration → redirect to login page
                response.sendRedirect("login.jsp");
            } else {
                // ❌ Registration failed → back to register page with error
                request.setAttribute("error", "Registration failed, please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle duplicate email or other SQL exceptions
            if(e.getErrorCode() == 1062){ // MySQL duplicate entry
                request.setAttribute("error", "Email already registered!");
            } else {
                request.setAttribute("error", "Database error: " + e.getMessage());
            }
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}

