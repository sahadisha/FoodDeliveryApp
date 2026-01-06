# FoodDeliveryApp
A web-based Food Delivery Application built using JSP, Servlet, JDBC, and MySQL, designed for managing food orders, users, and restaurants. This project demonstrates a simple full-stack Java web application with database connectivity.

Table of Contents
-------------------------
Features

Technology Stack

Project Structure

Setup Instructions

Database Schema

Usage
----------------------
Future Enhancements

Author

Features
-------------------

User registration and login system.

Browse food items and restaurants.

Place, view, and track orders.

Admin panel to manage users, food items, and orders.

Responsive web interface.

Data persistence using MySQL database.

Technology Stack
-----------------------------

Frontend: JSP, HTML, CSS, Bootstrap

Backend: Java Servlet, JDBC

Database: MySQL

IDE: Eclipse IDE for Java EE Developers

Server: Apache Tomcat

Project Structure
-------------------------------
FoodDeliveryApp/
│
├─ src/
│   ├─ com.fooddelivery.servlet/        # All servlet classes
│   ├─ com.fooddelivery.dao/            # DAO classes for DB operations
│   ├─ com.fooddelivery.model/          # Java model/DTO classes
│   └─ com.fooddelivery.util/           # Database connection utilities
│
├─ WebContent/
│   ├─ WEB-INF/
│   │   └─ web.xml                      # Servlet configuration
│   ├─ css/
│   │   └─ styles.css                    # Styling files
│   ├─ js/
│   │   └─ scripts.js                    # JavaScript files
│   ├─ index.jsp                         # Home page
│   ├─ login.jsp
│   ├─ register.jsp
│   ├─ dashboard.jsp                     # User/Admin dashboard
│   └─ other JSP pages
│
├─ README.md
└─ .classpath / .project                # Eclipse configuration files


Setup Instructions
------------------------

1.Clone or Download Project:
-Download the project folder FoodDeliveryApp.

2.Setup Database:

-Create a MySQL database named food_delivery.
-Import the SQL script database.sql (if available) or create tables manually:

Configure Database Connection:
----------------------------------------

Update DBConnection.java (or equivalent) in util/ folder with your database credentials:

java
----------

private static final String URL = "jdbc:mysql://localhost:3306/food_delivery";
private static final String USER = "root";
private static final String PASSWORD = "your_password";
Import Project in Eclipse:

Open Eclipse → File → Import → Existing Projects into Workspace → Select FoodDeliveryApp folder.

Add Server:
--------------
Configure Apache Tomcat in Eclipse.

Right-click the project → Run As → Run on Server.

Access the Application:
---------------------------
Open browser and go to:


Usage
-------------

Register as a new user or Login if already registered.

Browse food items and add to cart.

Place orders and view order history.

Admin login allows managing food items, users, and orders.

Future Enhancements
Add payment gateway integration.

Enable order notifications via email/SMS.

Implement search and filter options for food items.

Add user reviews and ratings for food items.




Author
Disha Saha

Email: [hellodishasaha@gmailcom]

GitHub: []
