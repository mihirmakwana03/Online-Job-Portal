<html>
    <head>
        <title>Delete Employer</title>

    </head>
    <body>

        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.net.*" %>
        <%@page import="java.util.*" %>
        <%! String p, m, e, cd, email, fname, lname, j_id, pass, skills, c_type, job_cat, q_id, country, city;%>

        <%
//            session = request.getSession(true);
//            String j_id = (String) session.getAttribute("j_id");
//            String email = (String) session.getAttribute("email");
//            j_id = request.getParameter("j_id");
//            out.println("<script>alert(\"Welcome " + j_id + "!\");</script>");
        %>

        <%
            j_id = request.getParameter("j_id");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt4 = con4.prepareStatement("DELETE FROM seek_det WHERE j_id='" + j_id + "'");
                int k4 = stmt4.executeUpdate();
                PreparedStatement stmt = con4.prepareStatement("DELETE FROM experience WHERE j_id='" + j_id + "'");
                int k = stmt.executeUpdate();
                PreparedStatement stmt2 = con4.prepareStatement("DELETE FROM seek_login WHERE j_id='" + j_id + "'");
                int k2 = stmt2.executeUpdate();
                out.println("<script>alert(\"Seeker Deleted Successfully\");  </script>");
                out.println("<script> window.location.href = 'mng_seek.jsp';  </script>");

            } catch (SQLException e) {
                out.println("SQLException " + e.getMessage());
            } catch (ClassNotFoundException e1) {
                out.println("ClassNotFoundException " + e1.getMessage());
            } catch (IOException e2) {
                out.println("IOException " + e2.getMessage());
            }
        %>



    </body>

</html>