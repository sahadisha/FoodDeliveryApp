package com.fooddelivery.controller;

import com.fooddelivery.dao.FoodItemDAO;
import com.fooddelivery.model.FoodItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class FoodMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rid = request.getParameter("resturantId");
        if (rid == null) {
            response.sendRedirect("resturants.jsp");
            return;
        }

        int resturantId = Integer.parseInt(rid);

        FoodItemDAO dao = new FoodItemDAO();
        List<FoodItem> foodList = dao.getFoodItemsByResturant(resturantId);

        request.setAttribute("foodList", foodList);
        request.setAttribute("resturantId", resturantId);

        request.getRequestDispatcher("user/menu.jsp").forward(request, response);
    }
}

