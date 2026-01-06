package com.fooddelivery.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fooddelivery.model.CartItem;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int foodId = Integer.parseInt(request.getParameter("foodId"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;
        for (CartItem item : cart) {
            if (item.getFoodId() == foodId) {
                item.setQuantity(item.getQuantity() + 1);
                found = true;
                break;
            }
        }

        if (!found) {
            CartItem item = new CartItem();
            item.setFoodId(foodId);
            item.setName(name);
            item.setPrice(price);
            item.setQuantity(1);
            cart.add(item);
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}
 