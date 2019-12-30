# OnlineStoreAdmin
A basic java web application that emulates admin privileges of inserting (while checking if all fields are fiiled and if price and/or tax that were given are legit numbers or not) and searching (with a simple form of 3 fields: barcode, name, description that returns everything containing at least one of given inputs) for products in a database

Empty fields return all the products in the database.

App written and tested in **NetBeans 8.2** (requires JDBC library, right click project>`Properties`>`Libraries`>`Add Library`>pick `MySQL JDBC Driver`).

Database tested in **XAMPP** and **MySQL Workbench 6.3 CE**.
