<html>
    <head>
        <title>Delete Job</title>

    </head>
    <body>

        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.net.*" %>
        <%@page import="java.util.*" %>
        <%! String job_id, c_name, skills, no_vac, job_cat, q_id, req, addr1, country, city;
        %>

        <%
            session = request.getSession(true);
            String e_id = (String) session.getAttribute("e_id");
            String email = (String) session.getAttribute("email");
            job_id = request.getParameter("job_id");
//            out.println("<script>alert(\"Welcome " + e_id + "!\");</script>");
        %>

        <%
            job_id = request.getParameter("job_id");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt4 = con4.prepareStatement("DELETE FROM vacancy WHERE job_id='" + job_id + "'");
                int k4 = stmt4.executeUpdate();
                out.println("<script>alert(\"Job Deleted Successfully\");  </script>");
                out.println("<script> window.location.href = 'jobs_p.jsp';  </script>");

            } catch (SQLException e) {
                out.println("SQLException " + e.getMessage());
            } catch (ClassNotFoundException e1) {
                out.println("ClassNotFoundException " + e1.getMessage());
            } catch (IOException e2) {
                out.println("IOException " + e2.getMessage());
            }
        %>

<!--        <script>
            window.location.href = 'jobs_p.jsp';
        </script>-->



    </body>

</html>