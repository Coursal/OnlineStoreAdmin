<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Store - Insert</title>
    </head>
    <body>
        <h3>Insert a product</h3>
        <br>
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
                
                //as long as there is connection with the database...
                if(db_connection != null)
                {
                    db_statement = db_connection.createStatement();
                    request.setCharacterEncoding("UTF-8");
                    
                    //reading the product's info given by user from insert.html...
                    String product_barcode = request.getParameter("product_barcode");
                    String product_name = request.getParameter("product_name");
                    String product_price = request.getParameter("product_price");
                    String product_tax = request.getParameter("product_tax");
                    String product_descr = request.getParameter("product_descr");
                    
                    String sql_insert = "";
                    
                    //checking if the products value and tax is a number or not (if not, the NumberFormatException gets caught)...
                    Double.parseDouble(product_price);
                    Double.parseDouble(product_tax);

                    //checking if the user filled all the fields in the form from insert.html (if not, the user gets redirected to missingdata.html)...
                    if((product_barcode == null || product_barcode.equals("")) || (product_name == null || product_name.equals("")) || (product_price == null || product_price.equals("")) || (product_tax == null || product_tax.equals("")) || (product_descr == null || product_descr.equals("")))
                        response.sendRedirect("missingdata.html");
                    else
                        sql_insert = "INSERT INTO products(barcode, name, price, tax, description) VALUES ('"+product_barcode+"','"+product_name+"','"+product_price+"', '"+product_tax+"','"+product_descr+"')";
                    
                    int count = db_statement.executeUpdate(sql_insert);
                    
                    if(count == 1)
                        out.println("The new product got inserted to database!");    
                }
            }
            catch(SQLException e)
            {
                db_connection = null;
                out.println("SQLException caught: " + e.getMessage());
            }
            catch(NumberFormatException e)
            {
                response.sendRedirect("errornumber.html");
            } 
        %>
        
        <br><br>
        <a href="index.html">Back</a>
        
    </body>
</html>
