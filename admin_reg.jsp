<html>

    <body>
        <%@ page import="java.io.* " %>
        <%@ page import="java.sql.* " %>
        <%@ page import="java.net.* " %>
        <%@page import="java.util.*" %>
        <%! String u_id, pwd, fname, lname, p, country, city, cd;%>

        <%
            p = request.getParameter("phone");
            Calendar cl = Calendar.getInstance();
            cd = String.format("%04d-%02d-%02d", cl.get(Calendar.YEAR), cl.get(Calendar.MONTH) + 1, cl.get(Calendar.DATE));
            fname = request.getParameter("fname");
            lname = request.getParameter("lname");
            u_id = request.getParameter("u_id");
            pwd = request.getParameter("pwd");
            country = request.getParameter("country");
            city = request.getParameter("city");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt1 = con1.prepareStatement("insert into admin_det values(?,?,?,?,?,?,?)");
                stmt1.setString(1, u_id);
                stmt1.setString(2, fname);
                stmt1.setString(3, lname);
                stmt1.setString(4, p);
                stmt1.setString(5, country);
                stmt1.setString(6, city);
                stmt1.setString(7, cd);
                int k1 = stmt1.executeUpdate();
                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt2 = con2.prepareStatement("insert into admin values(?,?)");
                stmt2.setString(1, u_id);
                stmt2.setString(2, pwd);
                int k2 = stmt2.executeUpdate();
                out.println("<script>alert(\" New Admin Registered Successfully\");  </script>");
                response.sendRedirect("page.html");
                con1.close();
                stmt1.close();
                con2.close();
                stmt2.close();
            } catch (SQLException e) {
                out.println("SQLException error :" + e.getMessage());
            } catch (ClassNotFoundException e1) {
                out.println("ClassNotFoundException error :" + e1.getMessage());
            } catch (IOException e2) {
                out.println("IOException error :" + e2.getMessage());
            }

        %>

    </body>

</html>