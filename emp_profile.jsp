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
    <% n = request.getParameter("e_id");
        p = request.getParameter("password");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root",
                    "");
            PreparedStatement pstm = con.prepareStatement(" select * from emp_det where e_id ='" + n + "'  ");

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
                <li><a href="post_job.html">Post Job</a></li>
                <li><a href="seeker.html">Employee Register</a></li>
            </ul>
            <ul id="feed">
                <li><a href="jobs_p.jsp">Posted Jobs</a></li>
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
                                <font size=5>Online Candidates Search</font>
                                <p>
                                    <font size=4>Easy way to find your candidate!</font>
                                </p>
                            </h1><br>
                            <p>Enter keywords,job categories,location,etc, to start your search.</p>
                            <form name="qsearch" action="q_search.jsp" method="post">
                                <p>Skills: <input type="text"  name="f1" placeholder="Java, C++, PHP">&nbsp;&nbsp;&nbsp;
                                    City: <input type="text"  name="f2" placeholder="Anand, Mumbai, Banglore">
                                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="submit" value="Start Search">
                                </p>
                            </form>
                            <p>Keywords(eg:c,c++,java),categories(eg:IT,sales,call centers)</p>
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
                            <h2>Advanced Search</h2>

                            <p><a href="resume_search.jsp">Search Resume.</a></p>
                            <p></p>
                        </li>
                        
                        <li>
                            <h2>Applied Candidates</h2>

                            <p><a href="applied.jsp?e_id=<%= n %>">Applied Candidates</a></p>
                            <p></p>
                        </li>
                        <li>
                            <h2>Check your Inbox:</h2>
                            <form action="emp_inbox.jsp" method="post">
                                <ul class="login-form">
                                    <li>
                                        <label for="e_id">Username:</label>
                                        <input type="text" name="e_id" size="15">
                                    </li>
                                    <li>
                                        <label for="pwd">Password:</label>
                                        <input type="password" name="pwd" size="15">
                                    </li>
                                    <li class="center">
                                        <input type="submit" value="Check Inbox">
                                    </li>
                                </ul>
                            </form>
                        </li>
                        <li>
                            <h2>Are you a JOB SEEKER?</h2>
                            <p>
                            <ul><a href="seeker.html">CLICK HERE.</a></ul>
                            </p>
                        </li>
                        <li>
                            <h2>Ease your SEARCH BY</h2>

                            <% n = request.getParameter("e_id");
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root",
                                            "");
                                    PreparedStatement pstm = con.prepareStatement(" select * from emp_det where e_id ='" + n + "'  ");

                                    ResultSet res = pstm.executeQuery();
                                    while (res.next()) {
                                        email = res.getString(2);
                                        session.putValue(n, email);

                                        out.println(" <p>CATEGORY:<a href = jobcat.jsp ? e_id = " + n + "& email = " + email + "> IT | Sales | Finance | Marketing</a></p>");

                                    }
                                } catch (SQLException e) {

                                } catch (ClassNotFoundException e1) {

                                } catch (IOException e2) {
                                }
                            %>

                            <% n = request.getParameter("e_id");
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root",
                                            "");
                                    PreparedStatement pstm = con.prepareStatement(" select * from emp_det where e_id ='"
                                            + n + "'  ");
                                    ResultSet res = pstm.executeQuery();
                                    while (res.next()) {
                                        email = res.getString(2);
                                        session.putValue(n,
                                                email);
                                        out.println(" <p>LOCATION:<a href = place.jsp ? e_id = " + n + "& email = " + email + " > Delhi | Mumbai | Kolkata | Chennai </a></p>");

                                    }
                                } catch (SQLException e) {

                                } catch (ClassNotFoundException e1) {

                                } catch (IOException e2) {
                                }
                            %>
                            <% n = request.getParameter("e_id");
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root",
                                            "");
                                    PreparedStatement pstm = con.prepareStatement(" select * from emp_det where e_id ='"
                                            + n + "'  ");
                                    ResultSet res = pstm.executeQuery();
                                    while (res.next()) {
                                        email = res.getString(2);
                                        session.putValue(n,
                                                email);
                                        out.println(" <p>TYPE:<a href = type.jsp ? e_id = " + n + "& email = " + email + " > Company | Placement  Agency </a></p></li>");

                                    }
                                } catch (SQLException e) {

                                } catch (ClassNotFoundException e1) {

                                } catch (IOException e2) {
                                }
                            %>



                    </ul>
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