<html>
    <head>
        <title>Delete Employer</title>

    </head>
    <body>

        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.net.*" %>
        <%@page import="java.util.*" %>
        <%! String p, m, email, fname, lname, address, e_id, pass, c_name, reg_no, c_type, skills, no_vac, job_cat, q_id, req, addr1, country, city, dor;
        %>

        <%
//            session = request.getSession(true);
//            String e_id = (String) session.getAttribute("e_id");
//            String email = (String) session.getAttribute("email");
//            e_id = request.getParameter("e_id");
//            out.println("<script>alert(\"Welcome " + e_id + "!\");</script>");
        %>

        <%
            e_id = request.getParameter("e_id");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt4 = con4.prepareStatement("DELETE FROM emp_det WHERE e_id='" + e_id + "'");
                int k4 = stmt4.executeUpdate();
                PreparedStatement stmt = con4.prepareStatement("DELETE FROM company WHERE e_id='" + e_id + "'");
                int k = stmt.executeUpdate();
                PreparedStatement stmt2 = con4.prepareStatement("DELETE FROM emp_login WHERE e_id='" + e_id + "'");
                int k2 = stmt2.executeUpdate();
                out.println("<script>alert(\"Employer Deleted Successfully\");  </script>");
                out.println("<script> window.location.href = 'mng_emp.jsp';  </script>");

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