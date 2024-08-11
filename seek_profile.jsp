<!DOCTYPE html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Online Job Portal</title>
    <link href="default.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%@page import="java.net.*" %>
    <%! String n, p, f, email;%>
    <% n = request.getParameter("j_id");
        p = request.getParameter("pwd");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
            PreparedStatement pstm = con.prepareStatement(" select * from seek_det where j_id ='" + n + "'  ");

            ResultSet res = pstm.executeQuery();
            while (res.next()) {
                f = res.getString(3);
                out.println("<script>alert(\"Welcome " + f + "!\");</script>");
                
            }
        } catch (SQLException e) {

        } catch (ClassNotFoundException e1) {

        } catch (IOException e2) {
        }
    %>



    <div id="header">
        <div id="logo">
            <h1><a href="#"><span>Online Job Portal</span></a></h1>

        </div>
        <div id="menu">
            <ul id="main">
                <li class="current_page_item"><a href="home.html">Home</a></li>
                <!--<li><a href="resume.jsp">Submit Resume</a></li>-->
                <li><a href="jobs_applied.jsp?j_id=<%= n %>">Applied Jobs</a></li>
                <li><a href="employer.html">Employer Register</a></li>
            </ul>
            <ul id="feed">
                <li><a href="search.html">Search</a></li>
                <li><a href="logout.jsp">Log Out</a></li>
            </ul>
        </div>

    </div>
    <div id="wrapper">
        <!-- start page -->
        <div id="page">
            <div id="page-bgtop">
                <div id="page-bgbtm">

                    <div id="content">
                        <div class="post">
                            <h1 class="title">
                                <font size=5>Quick Job Search</font>
                                <p>
                                    <font size=4></font>
                                </p>
                            </h1>
                            <p>Enter keywords,job categories,location,etc, to start your search.</p>
                            <% n = request.getParameter("j_id");
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                                    PreparedStatement pstm = con.prepareStatement(" select * from seek_det where j_id ='" + n + "'  ");
                                    ResultSet res = pstm.executeQuery();
                                    while (res.next()) {
                                        email = res.getString(2);
                                        session.setAttribute(n, email);
                                        out.println("<form name=search_z action=jobs.jsp?j_id="+n+"&email="+email+"method=post>");

                                    }
                                } catch (SQLException e) {

                                } catch (ClassNotFoundException e1) {

                                } catch (IOException e2) {
                                }
                            %>

                            <p><input type="text" size="50" name="search">&nbsp;&nbsp;&nbsp;
                                <input type="submit" value="Start Search"></form>
                            </p>
                            <p>Keywords(eg:c,c++,java),categories(eg:IT,sales,call centers)</p>
                            <p>
                                <font size=3>|<a href="advance.html">Advanced Job Search</a>|<a
                                    href="job_cat.jsp">Jobs by Category</a>|<a
                                    href="job_loc.jsp">Jobs by Location</a></font>
                            </p>
                        </div>
                    </div>
                </div>

                <div id="sidebar2" class="sidebar">
                    <ul>
                        <li>

                            <div>
                            </div>

                        </li>

                        <li>
                            <h2>other Searches</h2>


                            <p><a href="search.html">Search other resume</a></p>
                            <p>
                                <font size=4>Security Notice:Keep your id and password safe</font>
                            </p>
                        </li>
                        <li>
                            <h2>Are you an Employer?</h2>
                            <p>
                            <ul><a href="employer.html">CLICK HERE.</a></ul>
                            </p>
                        </li>
                        <li>
                            <h2>Check your inbox for mails</h2>
                            <form action="inbox.jsp" method="post">
                                <ul>
                                    <li>
                                        <label for="username">Username:</label>
                                        <input type="text" name="j_id" id="username" class="textbox">
                                    </li>
                                    <li>
                                        <label for="password">Password:</label>
                                        <input type="password" name="pwd" id="password" class="textbox">
                                    </li>
                                    <li class="center">
                                        <input type="submit" value="Check Inbox" name="inbox">
                                    </li>
                                </ul>
                            </form>
                            <style>label {
                                    width: 70px;
                                }
                                .center input {
                                    width: 300px;
                                }</style>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <p class="copyright">
            <font size=4> Copyright © Online Job Portal</font>
        </p>
    </div>
</body>

</html>