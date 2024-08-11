<html>
    <head>
        <title>Edit Jobs</title>
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
                    out.println("<form action='update_job.jsp' method='post'>"
                            + "<ul>"
                            + "<li>"
                            + "<label for='company_name'>Company Name:</label>"
                            + "</li>"
                            + "<li>"
                            + "<input type='text' id='company_name' name='c_name' class='textbox' value='" + c_name + "'>"
                            + "</li>"
                            + "<li>"
                            + "<label for='skills'>Skills Required:</label>"
                            + "</li>"
                            + "<li>"
                            + "<input type='text' id='skills_required' name='skills' class='textbox' value='" + skills + "'>"
                            + "</li>"
                            + "<li>"
                            + "<label for='num_vacancies'>No. of Vacancies:</label>"
                            + "</li>"
                            + "<li>"
                            + "<input type='text' id='num_vacancies' name='no_vac' class='textbox' value='" + no_vac + "'>"
                            + "</li>"
                            + "<li>"
                            + "<label for='job_category'>Job Category:</label>"
                            + "</li>"
                            + "<li>"
                            + "<select id='job-category' name='job_cat' class='textbox'>"
                            + "<option selected value='" + job_cat + "'>" + job_cat + "</option>"
                            + "<option value='IT'>IT</option>"
                            + "<option value='sales'>Sales</option>"
                            + "<option value='finance'>Finance</option>"
                            + "<option value='marketing'>Marketing</option>"
                            + "</select>"
                            + "</li>"
                            + "<li>"
                            + "<label for='q_id'>Qualification:</label>"
                            + "</li>"
                            + "<li>"
                            + "<select id='qualification' name='q_id' class='textbox'>"
                            + "<option selected value='" + q_id + "' selected>" + q_id + "</option>"
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
                            + "<label for='req'>Requirements:</label>"
                            + "</li>"
                            + "<li>"
                            + "<select id='requirement' name='req' class='textbox'>"
                            + "<option selected value='" + req + "' selected>" + req + "</option>"
                            + "<option value='immediate'>Immediate</option>"
                            + "<option value='within 1 month'>Within 1 month</option>"
                            + "<option value='within 3 months'>Within 3 months</option>"
                            + "<option value='within 6 months'>Within 6 months</option>"
                            + "<option value='within 12 months'>Within 12 months</option>"
                            + "</select>"
                            + "</li>"
                            + "<li>"
                            + "<label for='address'>Address:</label>"
                            + "</li>"
                            + "<li>"
                            + "<input type='text' id='address' name='addr1' class='textbox' value='" + addr1 + "' >"
                            + "</li>"
                            + "<li>"
                            + "<label for='country'>Country:</label>"
                            + "</li>"
                            + "<li>"
                            + "<select name='country' id='country' class='textbox'>"
                            + "<option value='" + country + "' selected>" + country + "</option>"
                            + "</select>"
                            + "</li>"
                            + "<li>"
                            + "<label for='city'>City:</label>"
                            + "</li>"
                            + "<li>"
                            + "<select name='city' id='city' class='textbox'>"
                            + "<option value='" + city + "' selected>" + city + "</option>"
                            + "<option value='Delhi'>Delhi</option>"
                            + "<option value='Mumbai'>Mumbai</option>"
                            + "<option value='Chennai'>Chennai</option>"
                            + "<option value='Kolkata'>Kolkata</option>"
                            + "</select>"
                            + "</li>"
                            + "</ul>"
                            + "<input type='hidden' name='job_id' value='" + job_id + "'>"
                            + "<input type='submit' value='Update Job'>"
                            + "</form>"
                    );

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