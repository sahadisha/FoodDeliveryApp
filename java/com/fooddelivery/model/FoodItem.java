package com.fooddelivery.model;

public class FoodItem {
    private int foodId;
    private int resturantId;
    private String name;
    private double price;

    public int getFoodId() { return foodId; }
    public void setFoodId(int foodId) { this.foodId = foodId; }

    public int getResturantId() { return resturantId; }
    public void setResturantId(int resturantId) { this.resturantId = resturantId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
