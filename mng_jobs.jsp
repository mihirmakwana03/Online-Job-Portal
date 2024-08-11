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


        <form action="mng_jobs2.jsp">

            <ul>
                <li>Please enter the Employer ID of the job you want to find.</li>
                <li><label for="e_id">Enter Employer Id :</label>
                    <input type="text" name="e_id" id="e_id">
                </li>
            </ul>

            <ul class="form-field">
                <li class="center"><input type="submit" value="Submit"></li>
            </ul>

        </form>
        <br><br><br>

        <h1 align='center' style='background-color:grey; padding:5px; border-radius:5px; font-family:Cursive;'>Jobs</h1>

        <%! String job_id, c_name, skills, no_vac, job_cat, q_id, req, addr1, country, e_id, city;%>

        <%

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement pstm = con.prepareStatement(" select * from vacancy ");

                ResultSet res = pstm.executeQuery();

                if (!res.next()) {
                    out.println("No record Found");
                } else {
                    do {

                        job_id = res.getString(1);
                        c_name = res.getString(2);
                        e_id = res.getString(3);
                        skills = res.getString(11);
                        no_vac = res.getString(5);
                        job_cat = res.getString(4);
                        q_id = res.getString(6);
                        req = res.getString(7);
                        addr1 = res.getString(8);
                        country = res.getString(10);
                        city = res.getString(9);

                        //-------------------------------------------
                        out.println("<table align='center'>"
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
                                + "<td><a href='job_del.jsp?e_id=" + e_id + "&job_id=" + job_id + "'>Delete</a></td>"
                                + "</tr>"
                                + "</table><br><br>");

                    } while (res.next());

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
