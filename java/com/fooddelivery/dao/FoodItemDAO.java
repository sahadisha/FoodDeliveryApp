package com.fooddelivery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fooddelivery.model.FoodItem;
import com.fooddelivery.util.DBConnection;

public class FoodItemDAO {

    public List<FoodItem> getFoodItemsByResturant(int resturantId) {

        List<FoodItem> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM food_items WHERE resturant_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, resturantId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FoodItem f = new FoodItem();
                f.setFoodId(rs.getInt("food_id"));
                f.setName(rs.getString("name"));
                f.setPrice(rs.getDouble("price"));
                list.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}

