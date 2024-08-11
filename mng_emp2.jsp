
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 5px;
                text-align: center;
            }
            th {
                background-color: #ccc;
                text-align: center;
            }
        </style>
    </head>
    <body>

        <%@ page import="java.io.* " %>
        <%@ page import="java.sql.* " %>
        <%@ page import="java.net.* " %>
        <%@page import="java.util.*" %>
        <%! String p, m, email, fname, lname, address, e_id, pass, c_name, reg_no, c_type, skills, no_vac, job_cat, q_id, req, addr1, country, city, dor;
        %>

        <%
            session = request.getSession(true);
            String admin = (String) session.getAttribute("admin");
        %>

        <%
            e_id = request.getParameter("e_id");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement pstm = con.prepareStatement(" select * from emp_det where e_id ='" + e_id + "' ");

                ResultSet res = pstm.executeQuery();

                if (!res.next()) {
                    out.println("No record Found");
                } else {
                    do {
                        e_id = res.getString(1);
                        email = res.getString(2);
                        fname = res.getString(3);
                        lname = res.getString(4);
                        p = res.getString(5);
                        addr1 = res.getString(6);

                        out.println("<table>"
                                + "<tr>"
                                + "<tr><th colspan='8'>Employer Details</th></tr>"
                                + "<th>Employer Id</th>"
                                + "<th>Email</th>"
                                + "<th>First Name</th>"
                                + "<th>Last Name</th>"
                                + "<th>Phone </th>"
                                + "<th>Address</th>"
                                + "</tr>"
                                + "<tr>"
                                + "<td>" + e_id + "</td>"
                                + "<td>" + email + "</td>"
                                + "<td>" + fname + "</td>"
                                + "<td>" + lname + "</td>"
                                + "<td>" + p + "</td>"
                                + "<td>" + addr1 + "</td>"
                                + "</tr>"
                                + "</table><br>");
                    } while (res.next());
                }

                //
                //
                PreparedStatement pstm2 = con.prepareStatement(" select * from company where e_id ='" + e_id + "' ");

                ResultSet res2 = pstm2.executeQuery();
                if (!res2.next()) {
                    out.println("No record Found");
                } else {
                    do {

                        reg_no = res2.getString(1);
                        e_id = res2.getString(2);
                        c_name = res2.getString(3);
                        addr1 = res2.getString(4);
                        country = res2.getString(5);
                        city = res2.getString(6);

                        out.println("<table>"
                                + "<tr>"
                                + "<tr><th colspan='8'>Company Details</th></tr>"
                                + "<th>Registration No.</th>"
                                + "<th>Employer Id</th>"
                                + "<th>Company Name</th>"
                                + "<th>Address</th>"
                                + "<th>Country</th>"
                                + "<th>City</th>"
                                + "<th>Update Employer</th>"
                                + "<th>Delete Employer</th>"
                                + "</tr>"
                                + "<tr>"
                                + "<td>" + reg_no + "</td>"
                                + "<td>" + e_id + "</td>"
                                + "<td>" + c_name + "</td>"
                                + "<td>" + addr1 + "</td>"
                                + "<td>" + country + "</td>"
                                + "<td>" + city + "</td>"
                                + "<td><a href='emp_edit.jsp?e_id=" + e_id + "'>Edit</a></td>"
                                + "<td><a href='emp_del.jsp?e_id=" + e_id + "'>Delete</a></td>"
                                + "</tr>"
                                + "</table><br>");

                    } while (res2.next());
                }

//                //
//                //
//                PreparedStatement pstm3 = con.prepareStatement(" select * from emp_login where e_id ='" + e_id + "' ");
//
//                ResultSet res3 = pstm3.executeQuery();
//                while (res3.next()) {
//                    e_id = res3.getString(1);
//                }
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
