<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Define some basic styles for the form elements */
            input[type=text], input[type=password] {
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
                width: 100%;
                box-sizing: border-box;
                margin-bottom: 10px;
            }

            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            /* Center the form on the page */
            form {
                width: 300px;
                margin: 0 auto;
                margin-top: 50px;
                background-color: #f2f2f2;
                border-radius: 5px;
                padding: 20px;
                box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
            }

            /* Add some styling to the labels */
            label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            /* Add some spacing between form elements */
            ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            ul li {
                margin-bottom: 10px;
            }

            /* Style the form submit button on hover */
            input[type=submit]:hover {
                background-color: #3e8e41;
            }
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

        <form action="mng_seek2.jsp">

            <ul>
                <li><label for="j_id">Enter Seeker Id :</label>
                    <input type="text" name="j_id" id="j_id">
                </li>
            </ul>

            <ul class="form-field">
                <li class="center"><input type="submit" value="Submit"></li>
            </ul>

        </form>
        <br><br><br>

        <h1 align='center' style='background-color:grey; padding:5px; border-radius:5px; font-family:Cursive;'>Seekers and Experience</h1>

        <%! String p, m, e, cd, email, fname, lname, j_id, pass, skills, c_type, job_cat, q_id, country, city;%>

        <%

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement pstm = con.prepareStatement(" select * from seek_det ");

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
                        //--------------------------------
                        PreparedStatement pstm2 = con.prepareStatement(" select * from experience where j_id ='" + j_id + "' ");

                ResultSet res2 = pstm2.executeQuery();
//                        if (!res2.next()) {
//                            out.println("No Company record Found");
//                        } else {
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

                            //-------------------------------------------
                            out.println("<table align='center'>"
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

                        out.println("<table align='center'>"
                                + "<tr>"
                                + "<tr><th colspan='8'>Experience</th></tr>"
                                + "<th>Job Category</th>"
                                + "<th>Experience</th>"
                                + "<th>skills</th>"
                                + "<th>Update Seeker</th>"
                                + "<th>Delete Seeker</th>"
                                + "</tr>"
                                + "<tr>"
                                + "<td>" + job_cat + "</td>"
                                + "<td>" + e + "</td>"
                                + "<td>" + skills + "</td>"
                                + "<td><a href='seek_edit.jsp?j_id=" + j_id + "'>Edit</a></td>"
                                + "<td><a href='seek_del.jsp?j_id=" + j_id + "'>Delete</a></td>"
                                + "</tr>"
                                + "</table><br><br>"
                                + "<hr style='border-style: solid; border-width: 2px;'>"
                                );

//                        }
                    } while (res.next());
                    //
                    //

                }

//                //
//                //
//                PreparedStatement pstm3 = con.prepareStatement(" select * from emp_login where j_id ='" + j_id + "' ");
//
//                ResultSet res3 = pstm3.executeQuery();
//                while (res3.next()) {
//                    j_id = res3.getString(1);
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
