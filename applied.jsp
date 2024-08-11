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
        <%! String Appl_id, status, fname, lname, p, cd;%>
        <%! String job_id, c_name, email, addr1, city, req, country, j_cat, q_id, key, no_vac, e_id, skills, j_id, seek_email;%>

        <%@ page import="java.sql.*" %>

        <table border="1" width="100%" align="center">
            <tr>
                <th>Applied ID</th>
                <th>Job ID</th>
                <th>Company</th>
                <th>Seeker Id</th>
                <th>Category</th>
                <th>Vacancy</th>
                <th>Qualification</th>
                <th>Requirement</th>
                <th>Address</th>
                <th>City</th>
                <th>Country</th>
                <th>Skills</th>
                <th>Seeker Email</th>
                <th>Status</th>
            </tr>

            <%
                job_id = request.getParameter("job_id");
                e_id = request.getParameter("e_id");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                    PreparedStatement stmt3 = con3.prepareStatement("select * from vacancy where e_id='" + e_id + "'");
                    ResultSet res = stmt3.executeQuery();

                    //--------------------------
                    if (!res.next()) {
                        out.println("No Jobs Found");
                    } else {
                        do {

                            job_id = res.getString(1);
                            c_name = res.getString(2);
                            skills = res.getString(11);
                            no_vac = res.getString(5);
                            j_cat = res.getString(4);
                            q_id = res.getString(6);
                            req = res.getString(7);
                            addr1 = res.getString(8);
                            country = res.getString(10);
                            city = res.getString(9);

                            Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                            PreparedStatement stmt4 = con4.prepareStatement("select * from jobs_applied where job_id='" + job_id + "'");
                            ResultSet res2 = stmt4.executeQuery();

                            if (!res2.next()) {
                                out.println("No candidates Found");
                            } else {
                                do {
                                    Appl_id = res.getString(1);
//                                    job_id = res.getString(2);
                                    j_id = res.getString(3);
                                    status = res.getString(4);
                                    out.print(status);

                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                                    PreparedStatement pstm = con.prepareStatement(" select * from seek_det where j_id ='" + j_id + "'  ");

                                    ResultSet res3 = pstm.executeQuery();
                                    if (!res3.next()) {
                                        out.println("No candidates Found");
                                    } else {
                                        do {

//                                            j_id = res.getString(1);
                                            email = res.getString(2);
                                            fname = res.getString(3);
                                            lname = res.getString(4);
                                            p = res.getString(5);
                                            q_id = res.getString(6);
                                            skills = res.getString(7);
                                            city = res.getString(8);
                                            country = res.getString(9);
                                            cd = res.getString(10);

                                            //
                                            out.println("<tr><td>" + Appl_id + "</td>"
                                                    + "<td>" + job_id + "</td>"
                                                    + "<td>" + c_name + "</td>"
                                                    + "<td>" + j_id + "</td>"
                                                    + "<td>" + j_cat + "</td>"
                                                    + "<td>" + no_vac + "</td>"
                                                    + "<td>" + q_id + "</td>"
                                                    + "<td>" + req + "</td>"
                                                    + "<td>" + addr1 + "</td>"
                                                    + "<td>" + city + "</td>"
                                                    + "<td>" + country + "</td>"
                                                    + "<td>" + skills + "</td>"
                                                    + "<td>" + email + "</td>"
                                                    + "<td>" + status + "</td></tr>");
                                        } while (res3.next());
                                    }

                                } while (res2.next());
                            }
                        } while (res.next());
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
