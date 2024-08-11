<!DOCTYPE html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Online Job Portal</title>
    <meta name="keywords" content="" />
    <meta name="Simple Passage" content="" />
    <link href="default.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>



    <div id="header">
        <div id="logo">
            <h1><a href="#"><span>Online Job Portal</span></a></h1>

        </div>
        <div id="menu">
            <ul id="main">
                <li class="current_page_item"><a href="home.html">Home</a></li>
                <li><a href="seeker.html">Submit Resume</a></li>
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
                                <font size=5>Jobs by Location</font>
                                <form action="location.jsp" method="post">
                                    <p>
                                        <font size=4></font>
                                    </p>
                            </h1>
                            <p>Select job location, to start your search.</p>
                            <p>Job Location:<select name="location" value="">
                                    <option value="Delhi">Delhi</option>
                                    <option value="Mumbai">Mumbai</option>
                                    <option value="Kolkata">Kolkata</option>
                                    <option value="Chennai">Chennai</option>
                                </select></p>

                            <p>
                            <center><input type="submit" value="Start Search"></center>
                            </form>
                            </p>
                            <p>
                                <font size=3><a href="seek_profile.jsp">Quick Job Search</a>|<a
                                    href="advance.html">Advanced Job Search<a>|<a href="job_cat.jsp">Jobs by
                                            Category</a>|</font>
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
                                                    <h2>other Searchs</h2>


                                                    <p><a href="search.html">Search other resume.</a></p>
                                                    <p>
                                                        <font size=4>Security Notice:Keep your id and password safe</font>
                                                    </p>
                                                </li>
                                                <li>
                                                    <h2>Are you an Employer?</h2>
                                                    <p>
                                                    <ul><a href="">CLICK HERE.</a></ul>
                                                    </p>
                                                </li>
                                                <li>
                                                    <h2>job seekers check your inbox</h2>
                                                    <form action="inbox.jsp" method="post">
                                                        <p>Username:<input type="text" name="j_id"></p>
                                                        <p>Password:<input type="password" name="pwd"></p>
                                                        <p><input type=submit value="Check Inbox" name="inbox">
                                                    </form>
                                                    </p>
                                                </li>

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