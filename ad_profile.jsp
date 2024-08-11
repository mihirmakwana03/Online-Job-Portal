<!DOCTYPE html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Online Job Portal</title>
    <link href="default.css" rel="stylesheet" type="text/css" />

</head>

<body>

    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%@page import="java.net.*" %>
    <%! int e_data, s_data, jobs_p;%>
    <%
        int e_data = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

            PreparedStatement pstm = con.prepareStatement("SELECT COUNT(*) FROM emp_det");
            ResultSet res = pstm.executeQuery();
            if (res.next()) {
                e_data = res.getInt(1);
//                out.println("<script>alert(\"Total Employer " + e_data + "\");</script>");
            }

            PreparedStatement pstm2 = con.prepareStatement("SELECT COUNT(*) FROM seek_det");
            ResultSet res2 = pstm2.executeQuery();
            if (res2.next()) {
                s_data = res2.getInt(1);
//                out.println("<script>alert(\"Total Job Seeker " + s_data + "\");</script>");
            }

            PreparedStatement pstm3 = con.prepareStatement("SELECT COUNT(*) FROM vacancy");
            ResultSet res3 = pstm3.executeQuery();
            if (res3.next()) {
                jobs_p = res3.getInt(1);
//                out.println("<script>alert(\"Total Job Posted " + jobs_p + "\");</script>");
            }

        } catch (SQLException e) {
            out.println("SQLException " + e.getMessage());
        } catch (ClassNotFoundException e1) {
            out.println("ClassNotFoundException " + e1.getMessage());
        }
    %>

    <!-- start header -->
    <div id="header">
        <div id="logo">
            <h1><a href="#"><span>Online Job Portal</span></a></h1>
        </div>
        <div id="menu">
            <ul id="main">
                <li class="current_page_item"><a href="home.html">Home</a></li>
                <li><a href="seeker.html">Employee Register</a></li>
                <li><a href="employer.html">Employer Register</a></li>

            </ul>
            <ul id="feed">
                <li><a href="search.html">Search</a></li>
                <li><a href="admin.html">Admin</a></li>
            </ul>
        </div>

    </div>
    <!-- end header -->


    <div id="wrapper">
        <!-- start page -->
        <div id="page">
            <div id="page-bgtop">
                <div id="page-bgbtm">

                    <!-- start content -->
                    <div id="content">
                        <div class="flower"></div>
                        <div class="post">
                            <h1 class="title">Total Employer Registered: <b> <%=  e_data%> </b></h1>
                            <p class="byline"></p>
                            <div class="entry">
                                <h3><a href="mng_emp.jsp" style="text-decoration:underline;"> Manage Employers </a></h3>
                            </div>
                        </div>

                        <div class="post">
                            <h1 class="title">Total Seeker Registered: <b> <%=  s_data%> </b></h1>
                            <p class="byline"></p>
                            <div class="entry">
                                <h3><a href="mng_seek.jsp" style="text-decoration:underline;"> Manage Job Seekers </a></h3>
                            </div>
                        </div>

                        <div class="post">
                            <h1 class="title">Total Jobs Posted: <b> <%=  jobs_p%> </b></h1>
                            <p class="byline"></p>
                            <div class="entry">
                                <h3><a href="mng_jobs.jsp" style="text-decoration:underline;"> Manage Jobs </a></h3>
                            </div>
                        </div>


                    </div>
                </div>
                <!-- end content -->
                <!-- start sidebars -->
                <div id="sidebar2" class="sidebar">
                    <ul>
                        <li></li>
                        <li>
                            <div>
                                <h2>Security Notice</h2>
                                <p>
                                    <font size=5>Keep your id and password safe!
                                </p>
                            </div>
                            </form>
                        </li>
                        <li>
                            <div>
                                <h2>Add New Admin</h2>
                                <p>
                                    <font size=5><a href="new_admin.html">New Admin</a>
                                </p>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h2>Employer</h2>
                                <p>
                                    <font size=5><a href="employer.html">Employer</a>
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- end sidebars -->
                <div style="clear: both;"></div>
            </div>
        </div>
    </div>
    <!-- end page -->
</div>
<div id="footer">
    <p class="copyright"> Copyright © Online Job Portal</p>
</div>
</body>

</html>