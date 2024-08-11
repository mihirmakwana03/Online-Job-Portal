
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
        <%! String job_id, c_name, skills, no_vac, job_cat, q_id, req, addr1, country, city;%>

        <%
            session = request.getSession(true);
            String admin = (String) session.getAttribute("admin");
        %>

        <%
            String e_id = request.getParameter("e_id");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement pstm = con.prepareStatement(" select * from vacancy where e_id ='" + e_id + "' ");

                ResultSet res = pstm.executeQuery();
                while (res.next()) {
                    job_id = res.getString(1);
                    c_name = res.getString(2);
                    skills = res.getString(11);
                    no_vac = res.getString(5);
                    job_cat = res.getString(4);
                    q_id = res.getString(6);
                    req = res.getString(7);
                    addr1 = res.getString(8);
                    country = res.getString(10);
                    city = res.getString(9);

//                    session.setAttribute("job_id", job_id);
//                    session.removeAttribute("job_id");
                    out.println("<table>"
                            + "<tr>"
                            + "<th>Company Name</th>"
                            + "<th>Skills Required</th>"
                            + "<th>No. of Vacancies</th>"
                            + "<th>Job Category</th>"
                            + "<th>Qualification</th>"
                            + "<th>Requirements</th>"
                            + "<th>Address</th>"
                            + "<th>Country</th>"
                            + "<th>City</th>"
//                            + "<th>Update Job</th>"
                            + "<th>Delete Job</th>"
                            + "</tr>"
                            + "<tr>"
                            + "<td>" + c_name + "</td>"
                            + "<td>" + skills + "</td>"
                            + "<td>" + no_vac + "</td>"
                            + "<td>" + job_cat + "</td>"
                            + "<td>" + q_id + "</td>"
                            + "<td>" + req + "</td>"
                            + "<td>" + addr1 + "</td>"
                            + "<td>" + country + "</td>"
                            + "<td>" + city + "</td>"
//                            + "<td><a href='job_edit.jsp?e_id=" + job_id + "'>Edit</a></td>"
                            +"<td><a href='job_del.jsp?e_id=" + e_id + "&job_id=" + job_id + "'>Delete</a></td>"
                            + "</tr>"
                            + "</table><br>");
                }
                

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
