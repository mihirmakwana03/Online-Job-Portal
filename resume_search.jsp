<!DOCTYPE html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Online Job Portal</title>
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
                                <font size=5>Resume Searching....</font>
                                <form name="research" action="re_search.jsp" method="post">
                                    <p>
                                        <font size=4></font>
                                    </p>
                            </h1>
                            <p>Enter keywords,job categories,location,etc, to start your search.</p>
                            <p><input type="text" size="50" name="search"></p>
                            <p>Keywords(eg:c,c++,java),categories(eg:IT,sales,call centers)</p>
                            <ul>
                                <li>
                                    <label for="location">Location:</label>
                                    <select name="location" id="location">
                                        <option value="Delhi">Delhi</option>
                                        <option value="Mumbai">Mumbai</option>
                                        <option value="Kolkata">Kolkata</option>
                                        <option value="Chennai">Chennai</option>
                                    </select>
                                </li>
                                <li>
                                    <label for="j_cat">Job category:</label>
                                    <select name="j_cat" id="j_cat">
                                        <option value="IT">IT</option>
                                        <option value="sales">Sales</option>
                                        <option value="finance">Finance</option>
                                        <option value="marketing">Marketing</option>
                                    </select>
                                </li>
                            </ul>

                            <ul>
                                <li class="center"><input type="submit" value="Start Advanced Search"></li>
                            </form>
                            </ul>

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
                            <h2>attention!</h2>



                            <p>
                                <font size=4>Security Notice:Keep your id and password safe</font>
                            </p>
                        </li>
                        <li>
                            <h2>Are you a job seeker?</h2>
                            <p>
                            <ul><a href="seeker.html">CLICK HERE.</a></ul>
                            </p>
                        </li>
                        <li>
                            <h2>Ease your resume SEARCH BY</h2>
                            <p>CATEGORY:<a href="jobcat_it.jsp">IT</a>|<a href="jobcat_sales.jsp">Sales</a>|<a
                                    href="jobcat_fin.jsp">Finance</a>|<a href="jobcat_market.jsp">Marketing</a></p>
                            <p>LOCATION:<a href="place.jsp">Delhi|Mumbai|Kolkata|Chennai</a></p>
                            <p>TYPE:<a href="type.jsp">Company|Placement Agency</a></p>
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