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
        <%! String job_id, c_name, skills, no_vac, job_cat, q_id, req, addr1, country, city;
        %>

        <%
            session = request.getSession(true);
            String e_id = (String) session.getAttribute("e_id");
            String email = (String) session.getAttribute("email");
//            String job_id = (String) session.getAttribute("job_id");
            job_id = request.getParameter("job_id");
//            out.println("<script>alert(\"Welcome " + e_id + "!\");</script>");
        %>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement pstm = con.prepareStatement(" select * from vacancy where job_id ='" + job_id + "'  ");

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
//                    out.println("<script>alert(\"Welcome " + job_id + "!\");</script>");
                    out.println("<form method='post' action=''>");
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
                            + "</tr></table>"
                            + "<input type='hidden' name='job_id' value='" + job_id + "'>"
                            + "<input type='submit' value='Delete Job' onclick='confirmClick();'>"
                            +"<h3><font color='red'>Note: Refresh after deleting the job and go back to previous page</font></h3>"
                    );
                    out.println("</form>");

                    out.println("<script>"
                            + "function confirmClick(){"
                            + "var confirmed = confirm('Are you sure you want to delete this job?');"
                            + "if (confirmed) {"
                            + "window.location.href = 'Delete_job.jsp?job_id=" + job_id + "';"
                            + "} else {"
                            + "window.location.href = 'jobs_p.jsp';"
                            + "}"
                            + "}"
                            + "</script>");

                }
            } catch (SQLException e) {
                out.println("SQLException " + e.getMessage());
            } catch (ClassNotFoundException e1) {
                out.println("ClassNotFoundException " + e1.getMessage());
            } catch (IOException e2) {
                out.println("IOException " + e2.getMessage());
            }
        %>


        <!--------------------------------------------------------------------------------------------------------->
        <!--Javascript-->


    </body>

</html>