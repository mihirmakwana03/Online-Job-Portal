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
        <%! String p, m, email, fname, lname, address, e_id, pass, c_name, reg_no, c_type, skills, no_vac, job_cat, q_id, req, addr1, country, city, dor;
        %>

        <%
//            session = request.getSession(true);
//            String e_id = (String) session.getAttribute("e_id");
//            String email = (String) session.getAttribute("email");
//            String e_id = (String) session.getAttribute("e_id");
            e_id = request.getParameter("e_id");
//            out.println("<script>alert(\"Welcome " + e_id + "!\");</script>");
        %>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement pstm = con.prepareStatement(" select * from emp_det where e_id ='" + e_id + "' ");

                ResultSet res = pstm.executeQuery();
                while (res.next()) {

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

                }
                //
                //
                PreparedStatement pstm2 = con.prepareStatement(" select * from company where e_id ='" + e_id + "' ");

                ResultSet res2 = pstm2.executeQuery();
                while (res2.next()) {

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
                            + "<th>Employee Id</th>"
                            + "<th>Company Name</th>"
                            + "<th>Address</th>"
                            + "<th>Country</th>"
                            + "<th>City</th>"
                            + "</tr>"
                            + "<tr>"
                            + "<td>" + reg_no + "</td>"
                            + "<td>" + e_id + "</td>"
                            + "<td>" + c_name + "</td>"
                            + "<td>" + addr1 + "</td>"
                            + "<td>" + country + "</td>"
                            + "<td>" + city + "</td>"
                            + "</tr>"
                            + "</table><br>"
                            + "<input type='submit' value='Delete Employer' onclick='confirmClick();'>"
                            +"<h3><font color='red'>Note: Refresh after deleting the Employer and go back to previous page</font></h3>"
                            );

                            out.println("<script>"
                            + "function confirmClick(){"
                            + "var confirmed = confirm('Are you sure you want to delete this Employer?');"
                            + "if (confirmed) {"
                            + "window.location.href = 'delete_emp.jsp?e_id=" + e_id + "';"
                            + "} else {"
                            + "window.location.href = 'mng_emp.jsp';"
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