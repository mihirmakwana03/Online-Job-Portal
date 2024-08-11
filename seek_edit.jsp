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
        <%! String p, m, e, email, cd, fname, lname, j_id, pass, skills, c_type, job_cat, q_id, country, city;%>

        <%
            session = request.getSession(true);
            j_id = request.getParameter("j_id");
        %>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement pstm = con.prepareStatement(" select * from seek_det where j_id ='" + j_id + "'  ");

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
//                    out.println("<script>alert(\"Welcome " + job_id + "!\");</script>");

                        out.println("<form action='update_seek.jsp' method='post'>");
                        out.println("<ul>");
                        out.println("<li><label for='email'>E-mail:</label>");
                        out.println("<input class='textbox' type='text' size='15' name='email' id='email' value='" + email + "'></li>");
                        out.println("<li><label for='fname'>First Name:</label>");
                        out.println("<input class='textbox' type='text' size='15' name='f_name' id='fname' value='" + fname + "'></li>");
                        out.println("<li><label for='lname'>Last Name:</label>");
                        out.println("<input class='textbox' type='text' size='15' name='l_name' id='lname' value='" + lname + "'></li>");
                        out.println("<li><label for='phone_no'>Phone:</label>");
                        out.println("<input class='textbox' type='text' size='15' name='phone_no' id='phone_no' value='" + p + "'></li>");
                        out.println("<li><label for='j_id'>Desired UserName:</label>");
                        out.println("<input class='textbox' type='text' size='15' name='j_id' id='j_id' value='" + j_id + "'></li>");

                        out.println("<ul>"
                                + "<li>"
                                + "<label for='q_id'>Qualification:</label>"
                                + "<select class='selectbox' name='q_id' id='q_id'>"
                                + "<option value='"+q_id+"'>"+q_id+"</option>"
                                + "<option value='Aviation'>Aviation</option>"
                                + "<option value='B.A.'>B.A.</option>"
                                + "<option value='B.Arch'>B.Arch</option>"
                                + "<option value='B.C.A'>B.C.A</option>"
                                + "<option value='C.A.'>C.A.</option>"
                                + "<option value='Diploma'>Diploma</option>"
                                + "<option value='MBA'>MBA</option>"
                                + "</select>"
                                + "</li>"
                                + "<li>"
                                + "<label for='skills'>Key Skills:</label>"
                                + "<input class='textbox' type='text' size='15' name='skills' id='skills' value='"+skills+"'>"
                                + "</li>"
                                + "</ul>"
                                + "<ul>"
                                + "<li>"
                                + "<label for='job_cat'>Category:</label>"
                                + "<select class='selectbox' name='job_cat' id='job_cat'>"
                                + "<option value='"+job_cat+"'>"+job_cat+"</option>"
                                + "<option value='IT'>IT</option>"
                                + "<option value='sales'>Sales</option>"
                                + "<option value='finance'>Finance</option>"
                                + "<option value='marketing'>Marketing</option>"
                                + "</select>"
                                + "</li>"
                                + "<li>"
                                + "<label for='exp'>Experience(in months):</label>"
                                + "<input class='textbox' type='text' size='15' name='exp' id='exp' value='"+e+"'>"
                                + "</li>"
                                + "</ul>");

                        out.println("<ul>");
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