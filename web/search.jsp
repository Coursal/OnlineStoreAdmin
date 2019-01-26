<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search products</title>
    </head>
    <body>
        <%
            String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            String db_URL = "jdbc:mysql://127.0.0.1:3306/dbproducts?characterEndoding=utf8";
            String db_USERNAME = "prodadmin";
            String db_PASSWORD = "78910";
            
            Connection db_connection = null;
            
            Statement db_statement = null;
            
            try
            {
                Class.forName(JDBC_DRIVER);
                db_connection = DriverManager.getConnection(db_URL, db_USERNAME, db_PASSWORD);
                
                if(db_connection != null)
                {
                    db_statement = db_connection.createStatement();
                    request.setCharacterEncoding("UTF-8");
                    
                    String product_barcode = request.getParameter("product_barcode");
                    String product_name = request.getParameter("product_name");
                    String product_descr = request.getParameter("product_descr");
                    
                    String sql_select = "";
                    
                    if(!product_barcode.equals("") && !product_name.equals("") && !product_descr.equals(""))
                        sql_select = "SELECT * FROM products WHERE prodcode LIKE '%"+product_barcode+"%' OR prodname LIKE '%"+product_name+"%' OR description LIKE '%"+product_descr+"%';"; 
                    else
                    {
                        if(!product_barcode.equals("") && !product_name.equals(""))  
                            sql_select = "SELECT * FROM products WHERE barcode LIKE '%"+product_barcode+"%' OR name LIKE '%"+product_name+"%';";
                        else if(!product_name.equals("") && !product_descr.equals(""))
                            sql_select = "SELECT * FROM products WHERE name LIKE '%"+product_name+"%' OR description LIKE '%"+product_descr+"%';";
                        else if(!product_barcode.equals("") && !product_descr.equals(""))
                            sql_select = "SELECT * FROM products WHERE barcode LIKE '%"+product_barcode+"%' OR description LIKE '%"+product_descr+"%';";
                        else if(!product_barcode.equals(""))
                            sql_select = "SELECT * FROM products WHERE barcode LIKE '%"+product_barcode+"%';";
                        else if(!product_name.equals(""))
                            sql_select = "SELECT * FROM products WHERE name LIKE '%"+product_name+"%';";
                        else if(!product_descr.equals(""))
                            sql_select = "SELECT * FROM products WHERE description LIKE '%"+product_descr+"%';";
                        else
                            sql_select = "SELECT * FROM products;";      
                    }
                    
                    ResultSet results = db_statement.executeQuery(sql_select);
                    
                    if(!results.isBeforeFirst())
                        out.println("No results found.");
                    else
                    {
                        while(results.next())
                        {
                            int id = results.getInt("id");
                            String barcode = results.getString("barcode");
                            String name = results.getString("name");
                            float product_price = results.getFloat("price");
                            float product_tax = results.getFloat("tax");
                            String description = results.getString("description");
                            
                            out.print("Product ID: " + String.valueOf(id) + "<br>");
                            out.print("Barcode: " + barcode + "<br>");
                            out.print("Name: " + name + "<br>");
                            out.print("Price: " + String.valueOf(product_price) + "<br>");
                            out.print("Tax: " + String.valueOf(product_tax) + "<br>");
                            out.print("Description: " + description + "<br>");
                            out.print("=========================<br>");     
                        }
                    }
                }
            }
            catch(SQLException e)
            {
                db_connection = null;
                out.println("SQLException caught: " + e.getMessage());
            }
        %>
        <br><br>
        <a href="search.html">Back</a>
    </body>
</html>
