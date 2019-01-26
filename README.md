# OnlineStoreAdmin
A basic java web application that emulates admin privileges of inserting and searching for products in a database

![](http://i64.tinypic.com/5v7hg8.png)

-----

### Inserting a product
It checks if all fields are filled.

It also checks if price and/or tax given are legit numbers.

![](http://i64.tinypic.com/2ez7348.png)

-----

### Searching products
A simple query of 3 fields (barcode, name, description) that returns everything containing at least one of given inputs.

Empty fields return all the products in the database.

![](http://i64.tinypic.com/mi0wtt.png)

-----

App written and tested in **NetBeans 8.2** (requires JDBC library, right click project>`Properties`>`Libraries`>`Add Library`>pick `MySQL JDBC Driver`).

Database tested in **XAMPP** and **MySQL Workbench 6.3 CE**.
