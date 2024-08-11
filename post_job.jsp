<html>

    <body>
        <%@ page import="java.io.* " %>
        <%@ page import="java.sql.* " %>
        <%@ page import="java.net.* " %>
        <%@page import="java.util.*" %>
        <%! String c_name, skills, no_vac, job_cat, q_id, req, addr1, country, city;
        %>

        <%
            session = request.getSession(true);
            String e_id = (String) session.getAttribute("e_id");
            String email = (String) session.getAttribute("email");
//            out.println("<script>alert(\"Welcome " + e_id + "!\");</script>");
        %>

        <%
            c_name = request.getParameter("c_name");
            skills = request.getParameter("skills");
            no_vac = request.getParameter("no_vac");
            job_cat = request.getParameter("job_cat");
            q_id = request.getParameter("q_id");
            req = request.getParameter("req");
            addr1 = request.getParameter("addr1");
            country = request.getParameter("country");
            city = request.getParameter("city");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt3 = con3.prepareStatement("insert into vacancy values(?,?,?,?,?,?,?,?,?,?,?,?)");
                stmt3.setString(1, null);
                stmt3.setString(2, c_name);
                stmt3.setString(3, e_id);
                stmt3.setString(4, job_cat);
                stmt3.setString(5, no_vac);
                stmt3.setString(6, q_id);
                stmt3.setString(7, req);
                stmt3.setString(8, addr1);
                stmt3.setString(9, city);
                stmt3.setString(10, country);
                stmt3.setString(11, skills);
                stmt3.setString(12, email);

                int k3 = stmt3.executeUpdate();
                out.println("<script>alert(\"Job Posted Successfully\"); window.location.href = 'emp_profile.jsp'; </script>");

                con3.close();

            } catch (SQLException e) {
                request.setAttribute("errorMessage", "SQL error: " + e.getMessage());
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            } catch (ClassNotFoundException e1) {
                request.setAttribute("errorMessage", "Class not found error: " + e1.getMessage());
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        %>

    </body>

</html>