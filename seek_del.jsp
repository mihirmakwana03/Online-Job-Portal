<html>
    <head>
        <title>Edit Jobs</title>
        <!--<script src="path/to/confirmAction.jsp"></script>-->
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 5px;
            }
            th {
                background-color: #ccc;
                text-align: left;
            }
            ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }

            li {
                margin-bottom: 10px;
            }

            label {
                display: block;
                font-weight: bold;
            }

            .textbox {
                display: block;
                width: 20%;
                padding: 5px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            select.textbox {
                width: 20%;
                height: 35px;
                background-color: #fff;
            }

            input[type="submit"] {
                display: inline-block;
                background-color: #008CBA;
                color: #fff;
                font-size: 16px;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 10px;
            }

            input[type="submit"]:hover {
                background-color: #006080;
            }


        </style>
    </head>

    <body>
        <h1>Delete Job</h1>

        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.net.*" %>
        <%@page import="java.util.*" %>
        <%! String p, m, e, cd, email, fname, lname, j_id, pass, skills, c_type, job_cat, q_id, country, city;%>

        <%
//            session = request.getSession(true);
//            String j_id = (String) session.getAttribute("j_id");
//            String email = (String) session.getAttribute("email");
//            String j_id = (String) session.getAttribute("j_id");
            j_id = request.getParameter("j_id");
//            out.println("<script>alert(\"Welcome " + j_id + "!\");</script>");
        %>

        <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                    PreparedStatement pstm = con.prepareStatement(" select * from seek_det where j_id ='" + j_id + "' ");

                    ResultSet res = pstm.executeQuery();
                    while (res.next()) {

                        j_id = res.getString(1);
                        email = res.getString(2);
                        fname = res.getString(3);
                        lname = res.getString(4);
                        p = res.getString(5);
                        q_id = res.getString(6);
                        skills = res.getString(7);
                        city = res.getString(8);
                        country = res.getString(9);
                        cd = res.getString(10);

                        out.println("<table>"
                                + "<tr>"
                                + "<tr><th colspan='9'>Seeker Details</th></tr>"
                                + "<th>Seeker Id</th>"
                                + "<th>Email</th>"
                                + "<th>First Name</th>"
                                + "<th>Last Name</th>"
                                + "<th>Phone </th>"
                                + "<th>Qualifications</th>"
                                + "<th>Skills</th>"
                                + "<th>City</th>"
                                + "<th>Country</th>"
                                + "</tr>"
                                + "<tr>"
                                + "<td>" + j_id + "</td>"
                                + "<td>" + email + "</td>"
                                + "<td>" + fname + "</td>"
                                + "<td>" + lname + "</td>"
                                + "<td>" + p + "</td>"
                                + "<td>" + q_id + "</td>"
                                + "<td>" + skills + "</td>"
                                + "<td>" + city + "</td>"
                                + "<td>" + country + "</td>"
                                + "</tr>"
                                + "</table><br>");


                }
                //
                //
                PreparedStatement pstm2 = con.prepareStatement(" select * from experience where j_id ='" + j_id + "' ");

                ResultSet res2 = pstm2.executeQuery();
                while (res2.next()) {

                    j_id = res2.getString(1);
                        job_cat = res2.getString(2);
                        e = res2.getString(3);
                        fname = res2.getString(4);
                        lname = res2.getString(5);
                        skills = res2.getString(6);
                        city = res2.getString(7);
                        country = res2.getString(8);
                        email = res2.getString(9);

                    out.println("<table>"
                                + "<tr>"
                                + "<tr><th colspan='8'>Experience</th></tr>"
                                + "<th>Job Category</th>"
                                + "<th>Experience</th>"
                                + "<th>skills</th>"
                                + "</tr>"
                                + "<tr>"
                                + "<td>" + job_cat + "</td>"
                                + "<td>" + e + "</td>"
                                + "<td>" + skills + "</td>"
                                + "</tr>"
                                + "</table><br>"
                                + "<input type='submit' value='Delete Employer' onclick='confirmClick();'>"
                            +"<h3><font color='red'>Note: Refresh after deleting the Employer and go back to previous page</font></h3>"
                                );

                    out.println("<script>"
                            + "function confirmClick(){"
                            + "var confirmed = confirm('Are you sure you want to delete this Seeker?');"
                            + "if (confirmed) {"
                            + "window.location.href = 'delete_seek.jsp?j_id=" + j_id + "';"
                            + "} else {"
                            + "window.location.href = 'mng_seek.jsp';"
                            + "}"
                            + "}"
                            + "</script>");
                }

            }
            catch (SQLException e

            
                ) {
                out.println("SQLException " + e.getMessage());
            }
            catch (ClassNotFoundException e1

            
                ) {
                out.println("ClassNotFoundException " + e1.getMessage());
            }
            catch (IOException e2

            
                ) {
                out.println("IOException " + e2.getMessage());
            }
        %>


        <!--------------------------------------------------------------------------------------------------------->
        <!--Javascript-->


    </body>

</html>