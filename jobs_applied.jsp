<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Applied Jobs</title>
        <link href="default.css" rel="stylesheet" type="text/css" />
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

        <h1>Applied Jobs</h1>
        <%! String Appl_id, status;%>
        <%! String job_id, c_name, email, addr1, city, req, country, j_cat, q_id, key, no_vac, e_id, skills, j_id, seek_email;%>

        <%@ page import="java.sql.*" %>

        <table border="1" width="100%" align="center">
            <tr>
                <th>Applied ID</th>
                <th>Job ID</th>
                <th>Company</th>
                <th>Employer Id</th>
                <th>Category</th>
                <th>Vacancy</th>
                <th>Qualification</th>
                <th>Requirement</th>
                <th>Address</th>
                <th>City</th>
                <th>Country</th>
                <th>Skills</th>
                <th>Employer Email</th>
                <th>Status</th>
            </tr>

            <%
                job_id = request.getParameter("job_id");
                j_id = request.getParameter("j_id");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                    PreparedStatement stmt3 = con3.prepareStatement("select * from jobs_applied where j_id='" + j_id + "'");
                    ResultSet res = stmt3.executeQuery();

                    while (res.next()) {
                        Appl_id = res.getString(1);
                        job_id = res.getString(2);
                        j_id = res.getString(3);
                        status = res.getString(4);

                        Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                        PreparedStatement stmt4 = con4.prepareStatement("select * from vacancy where job_id='" + job_id + "'");
                        ResultSet res2 = stmt4.executeQuery();

                        if (!res2.next()) {
                            out.println("No vacancies Found");
                        } else {
                            do {
                                job_id = res2.getString(1);
                                c_name = res2.getString(2);
                                e_id = res2.getString(3);
                                j_cat = res2.getString(4);
                                no_vac = res2.getString(5);
                                q_id = res2.getString(6);
                                req = res2.getString(7);
                                addr1 = res2.getString(8);
                                city = res2.getString(9);
                                country = res2.getString(10);
                                skills = res2.getString(11);
                                email = res2.getString(12);

                                out.println("<tr><td>" + Appl_id + "</td><td>" + job_id + "</td><td>" + c_name + "</td><td>" + e_id + "</td><td>" + j_cat + "</td><td>" + no_vac + "</td><td>" + q_id + "</td><td>" + req + "</td><td>" + addr1 + "</td><td>" + city + "</td><td>" + country + "</td><td>" + skills + "</td><td>" + email + "</td><td>" + status + "</td></tr>");
                            } while (res2.next());

                        }
                    }
                } catch (SQLException e) {
                    out.println("SQLException " + e.getMessage());
                } catch (ClassNotFoundException e1) {
                    out.println("ClassNotFoundException " + e1.getMessage());
                }
            %>

        </table>
    </body>
</html>
