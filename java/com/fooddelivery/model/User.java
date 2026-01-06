package com.fooddelivery.model;

public class User {

    private int id;           // user ID
    private String name;      // user name
    private String email;     // user email
    private String password;  // user password

    public User() {}

    public User(int id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    // Getter & Setter for id
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    // Getter & Setter for name
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    // Getter & Setter for email
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    // Getter & Setter for password
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
