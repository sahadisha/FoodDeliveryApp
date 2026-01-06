package com.fooddelivery.model;

public class CartItem {

    private int foodId;
    private String name;
    private double price;
    private int quantity;

    // getters & setters
    public int getFoodId() {
        return foodId;
    }

    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // ⭐ VERY IMPORTANT METHOD ⭐
    public double getTotal() {
        return price * quantity;
    }
}

