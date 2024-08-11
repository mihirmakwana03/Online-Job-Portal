<%--<jsp:include page="error.html" />--%>
<html>

    <body>
        <%@ page import="java.io.* " %>
        <%@ page import="java.sql.* " %>
        <%@ page import="java.net.* " %>
        <%@page import="java.util.*" %>
        <%! String p, m, e, email, fname, lname, j_id, pass, skills, c_type, job_cat, q_id, country, city;%>

        <% p = request.getParameter("phone_no");
            m = request.getParameter("mobile_no");
            e = request.getParameter("exp");
            Calendar cl = Calendar.getInstance();
            String cd = String.format("%04d-%02d-%02d", cl.get(Calendar.YEAR), cl.get(Calendar.MONTH) + 1, cl.get(Calendar.DATE));
            email = request.getParameter("email");
            fname = request.getParameter("f_name");
            lname = request.getParameter("l_name");
            j_id = request.getParameter("j_id");
            pass = request.getParameter("pwd");
            q_id = request.getParameter("q_id");
            skills = request.getParameter("skills");
            job_cat = request.getParameter("job_cat");
            c_type = request.getParameter("c_type");
            country = request.getParameter("country");
            city = request.getParameter("city");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt1 = con1.prepareStatement("insert into seek_det values(?,?,?,?,?,?,?,?,?,?)");
                stmt1.setString(1, j_id);
                stmt1.setString(2, email);
                stmt1.setString(3, fname);
                stmt1.setString(4, lname);
                stmt1.setString(5, p);
                stmt1.setString(6, q_id);
                stmt1.setString(7, skills);
                stmt1.setString(8, city);
                stmt1.setString(9, country);
                stmt1.setString(10, cd);
//                stmt1.setString(11, m);

                int k1 = stmt1.executeUpdate();
                System.out.println("Account created Succesfully");
                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt2 = con2.prepareStatement("insert into experience values(?,?,?,?,?,?,?,?,?)");
                stmt2.setString(1, j_id);
                stmt2.setString(2, job_cat);
                stmt2.setString(3, e);
                stmt2.setString(4, fname);
                stmt2.setString(5, lname);
                stmt2.setString(6, skills);
                stmt2.setString(7, city);
                stmt2.setString(8, country);
                stmt2.setString(9, email);
//                stmt2.setString(10, c_type);

                int k2 = stmt2.executeUpdate();
                Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt3 = con3.prepareStatement("insert into seek_login values(?,?)");
                stmt3.setString(1, j_id);
                stmt3.setString(2, pass);
                int k3 = stmt3.executeUpdate();
                response.sendRedirect("page.html");
                stmt1.close();
                stmt2.close();
                stmt3.close();
                con1.close();
                con2.close();
                con3.close();
                System.out.println("Account created Succesfully");
            } catch (SQLException e) {
                request.setAttribute("errorMessage", "SQL error: " + e.getMessage());
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            } catch (ClassNotFoundException e1) {
                request.setAttribute("errorMessage", "Class not found error: " + e1.getMessage());
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            } catch (IOException e2) {
                request.setAttribute("errorMessage", "I/O error: " + e2.getMessage());
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }%>

    </body>

</html>