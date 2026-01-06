package com.fooddelivery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.fooddelivery.model.Resturant;
import com.fooddelivery.util.DBConnection;

public class ResturantDAO {
    public List<Resturant> getAllResturants() {
        List<Resturant> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM resturants");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Resturant r = new Resturant();
                r.setResturantId(rs.getInt("resturant_id"));
                r.setName(rs.getString("name"));
                r.setLocation(rs.getString("location"));
                list.add(r);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}
