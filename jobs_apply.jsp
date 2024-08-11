<jsp:include page="blank.html" />
<html>

    <head>
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
        <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
        <%! String job_id, c_name, email, addr1, city, req, country, j_cat, q_id, key, no_vac, e_id, skills, j_id, seek_email, p, m, e, cd, fname, lname, pass, c_type, job_cat;%>

        <%
            j_id = request.getParameter("j_id");
            job_id = request.getParameter("job_id");
        %>

        <%
            //            seek_email = request.getParameter("email");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement pstm = con.prepareStatement(" select * from seek_det where j_id='" + j_id + "' ");
                ResultSet res = pstm.executeQuery();
                if (!res.next()) {
                    out.println("No record Found");
                } else {
                    do {

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

                        //-------------------
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
                    } while (res.next());
                }
            } catch (SQLException e) {
                out.println("Error of SQL " + e);
            } catch (ClassNotFoundException e1) {
                out.println("ClassNotFoundException " + e1);
            } catch (IOException e2) {
                out.println("IOException " + e2);
            }
        %>


        <form action="jobs_apply2.jsp?j_id=<%= j_id %>&job_id=<%= job_id %>" method="post">


            <table border="1" width="100%" align="center">
                <tr><th colspan="7">Job Details</th></tr>
                <tr>

                    <th>Email-id</th>
                    <th>Job Category</th>
                    <th>No. of Seats Vacant</th>
                    <th>Qualification req</th>
                    <th>Address</th>
                    <th>Skills Required</th>

                </tr>

                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                        PreparedStatement pstm = con.prepareStatement(" select * from vacancy where job_id='" + job_id + "' ");
                        ResultSet res = pstm.executeQuery();
                        if (!res.next()) {
                            out.println("No vacancies Found");
                        } else {
                            do {
                                job_id = res.getString(1);
                                c_name = res.getString(2);
                                j_id = res.getString(3);
                                j_cat = res.getString(4);
                                no_vac = res.getString(5);
                                q_id = res.getString(6);
                                req = res.getString(7);
                                addr1 = res.getString(8);
                                city = res.getString(9);
                                country = res.getString(10);
                                skills = res.getString(11);
                                email = res.getString(12);
                                out.println("<tr><td>" + email + "</td><td>" + j_cat + "</td><td>" + no_vac + "</td><td>" + q_id + "</td><td>" + addr1 + ", " + city + ", " + country + "</td><td>" + skills + "</td></tr>");

                                out.println("<table><br><br>");
                                out.println("<center>");
                                out.println("<input type='submit' value='Apply job' style='width: 20%; padding: 5px; ' onclick='confirmClick();'>");
                                out.println("</center>");
                                out.println("<script>");
                                out.println("function confirmClick() {");
                                out.println("var confirmed = confirm('Are you sure you want to Apply to this job?');");
                                out.println("if (confirmed) {");
                                out.println("window.location.href = 'jobs_apply2.jsp?j_id=" + j_id + "&job_id=" + job_id + "';");
                                out.println("} else {");
                                out.println("window.location.href = 'jobs.jsp';");
                                out.println("}");
                                out.println("}");
                                out.println("</script>");
                            } while (res.next());
                        }

                    } catch (SQLException e) {
                        out.println("Error of SQL " + e);
                    } catch (ClassNotFoundException e1) {
                        out.println("ClassNotFoundException " + e1);
                    } catch (IOException e2) {
                        out.println("IOException " + e2);
                    }

                %>
                <!--<center><input type=submit value="Send Request"></center>-->

        </form>
    </body>

</html>