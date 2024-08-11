<html>

    <body>
        <%@ page import="java.io.* " %>
        <%@ page import="java.sql.* " %>
        <%@ page import="java.net.* " %>
        <%@page import="java.util.*" %>
        <%! String p, m, email, fname, lname, address, e_id, pass, c_name, reg_no, c_type, skills, no_vac, job_cat, q_id, req, addr1, country, city, dor;
        %>

        <% p = request.getParameter("phone_no");
            m = request.getParameter("mobile_no");

            Calendar cl = Calendar.getInstance();
            String cd = String.format("%04d-%02d-%02d", cl.get(Calendar.YEAR), cl.get(Calendar.MONTH) + 1, cl.get(Calendar.DATE));

            email = request.getParameter("email");
            fname = request.getParameter("fname");
            lname = request.getParameter("lname");
            address = request.getParameter("address");
            e_id = request.getParameter("e_id");
            pass = request.getParameter("password");
            c_name = request.getParameter("c_name");
            reg_no = request.getParameter("reg_no");
            c_type = request.getParameter("c_type");
            skills = request.getParameter("skills");
            no_vac = request.getParameter("no_vac");
            job_cat = request.getParameter("job_cat");
            q_id = request.getParameter("q_id");
            req = request.getParameter("req");
            email = request.getParameter("email");
            addr1 = request.getParameter("addr1");
            country = request.getParameter("country");
            city = request.getParameter("city");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt1 = con1.prepareStatement("insert into emp_det values(?,?,?,?,?,?,?)");
                stmt1.setString(1, e_id);
                stmt1.setString(2, email);
                stmt1.setString(3, fname);
                stmt1.setString(4, lname);
                stmt1.setString(5, p);
//                stmt1.setString(6, m);
                stmt1.setString(6, addr1);
                stmt1.setString(7, cd);
                int k1 = stmt1.executeUpdate();
                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt2 = con2.prepareStatement("insert into company values(?,?,?,?,?,?)");
                stmt2.setString(1, reg_no);
                stmt2.setString(2, e_id);
                stmt2.setString(3, c_name);
                stmt2.setString(4, addr1);
                stmt2.setString(5, country);
                stmt2.setString(6, city);

                int k2 = stmt2.executeUpdate();
//                Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
//                PreparedStatement stmt3 = con3.prepareStatement("insert into vacancy values(?,?,?,?,?,?,?,?,?)");
//                stmt3.setString(1, e_id);
//                stmt3.setString(2, job_cat);
//                stmt3.setString(3, no_vac);
//                stmt3.setString(4, q_id);
//                stmt3.setString(5, addr1);
//                stmt3.setString(6, city);
//                stmt3.setString(7, country);
//                stmt3.setString(8, skills);
//                stmt3.setString(9, email);
//                int k3 = stmt3.executeUpdate();
                Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt4 = con4.prepareStatement("insert into emp_login values(?,?)");
                stmt4.setString(1, e_id);
                stmt4.setString(2, pass);
                int k4 = stmt4.executeUpdate();
                response.sendRedirect("page.html");
                con1.close();
                stmt1.close();
                con2.close();
                stmt2.close();
//                con3.close();
                stmt4.close();
                con4.close();
                stmt4.close();
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