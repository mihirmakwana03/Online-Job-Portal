<%-- 
    Document   : error
    Created on : 21 Mar, 2023, 9:11:29 PM
    Author     : Mihir's PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String errorMessage = (String) request.getAttribute("errorMessage");%>
        <p>An error has occurred: <%= errorMessage%></p>

    </body>
</html>
