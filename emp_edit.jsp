<html>
    <head>
        <title>Edit Employer</title>
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
        <h1>Edit Jobs</h1>
        <%@ page import="java.io.* " %>
        <%@ page import="java.sql.* " %>
        <%@ page import="java.net.* " %>
        <%@page import="java.util.*" %>
        <%! String p, m, email, fname, lname, address, e_id, pass, c_name, reg_no, c_type, skills, no_vac, job_cat, q_id, req, addr1, country, city, dor;
        %>

        <%
            session = request.getSession(true);
            e_id = request.getParameter("e_id");
        %>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement pstm = con.prepareStatement(" select * from emp_det where e_id ='" + e_id + "'  ");

                ResultSet res = pstm.executeQuery();
                while (res.next()) {

                    e_id = res.getString(1);
                    email = res.getString(2);
                    fname = res.getString(3);
                    lname = res.getString(4);
                    p = res.getString(5);
                    addr1 = res.getString(6);

                    PreparedStatement pstm2 = con.prepareStatement(" select * from company where e_id ='" + e_id + "' ");

                    ResultSet res2 = pstm2.executeQuery();
                    while (res2.next()) {

                        reg_no = res2.getString(1);
                        e_id = res2.getString(2);
                        c_name = res2.getString(3);
                        addr1 = res2.getString(4);
                        country = res2.getString(5);
                        city = res2.getString(6);
//                    out.println("<script>alert(\"Welcome " + job_id + "!\");</script>");

                        out.println("<form action='update_emp.jsp' method='post'>");
                        out.println("<ul>");
                        out.println("<li><label for='email'>E-mail:</label>");
                        out.println("<input class='textbox' type='text' size='15' name='email' id='email' value='" + email + "'></li>");
                        out.println("<li><label for='f_name'>First Name:</label>");
                        out.println("<input class='textbox' type='text' size='15' name='fname' id='f_name' value='" + fname + "'></li>");
                        out.println("<li><label for='l_name'>Last Name:</label>");
                        out.println("<input class='textbox' type='text' size='15' name='lname' id='l_name' value='" + lname + "'></li>");
                        out.println("<li><label for='phone_no'>Phone:</label>");
                        out.println("<input class='textbox' type='text' size='15' name='phone_no' id='phone_no' value='" + p + "'></li>");
                        out.println("<li><label for='e_id'>Desired UserName:</label>");
                        out.println("<input class='textbox' type='text' size='15' name='e_id' id='e_id' value='" + e_id + "'></li>");
//                        out.println("<li><label for='password'>Password:</label>");
//                        out.println("<input class='textbox' type='password' size='15' name='password' id='password'></li>");
//                        out.println("<li><label for='password_confirm'>Re-type Password:</label>");
//                        out.println("<input class='textbox' type='password' size='15' name='password_confirm' id='password_confirm'></li>");
                        out.println("</ul>");
                        out.println("<p><h2>COMPANY DETAILS:</h2></p>");
                        out.println("<ul>");
                        out.println("<li><label for='c_name'>Company Name:</label>");
                        out.println("<input type='text' class='textbox' size='15' name='c_name' id='c_name' value='" + c_name + "'></li>");
                        out.println("<li><label for='reg_no'>Registration No:</label>");
                        out.println("<input type='text' class='textbox' size='15' name='reg_no' id='reg_no' value='" + reg_no + "'></li>");
                        out.println("</ul>");
                        out.println("<p><h2>LOCATION:</h2></p>");
                        out.println("<ul class='form-field'><label for='addr1'>Address:</label>");
                        out.println("<input type='text' class='textbox' size='15' name='addr1' id='addr1' value='" + addr1 + "'></ul><br>");
                        out.println("<ul class='form-field'><label for='country'>Country:</label>");
                        out.println("<select class='selectbox' name='country' id='country'>");
                        out.println("<option  value='" + country + "'>" + country + "</option>");
                        out.println("</select></ul><br>");
                        out.println("<ul class='form-field'><label for='city'>City:</label>");
                        out.println("<select class='selectbox' name='city' id='city'>");
                        out.println("<option  value='" + city + "'>" + city + "</option>");
                        out.println("<option value='Delhi'>Delhi</option>");
                        out.println("<option value='Mumbai'>Mumbai</option>");
                        out.println("<option value='Chennai'>Chennai</option>");
                        out.println("<option value='Kolkata'>Kolkata</option>");
                        out.println("</select></ul>");
                        out.println("<input type='submit' value='Update Employer Details'></form>");
                    }
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