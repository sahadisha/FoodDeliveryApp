package com.fooddelivery.controller;

import com.fooddelivery.dao.ResturantDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/resturants")
public class ResturantServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ResturantDAO dao = new ResturantDAO();
        request.setAttribute("resturantList", dao.getAllResturants());
        request.getRequestDispatcher("user/resturants.jsp").forward(request, response);
    }
}
