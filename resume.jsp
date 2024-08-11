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
                <li><a href="resume.jsp">Submit Resume</a></li>
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
                                <font size=5>Submit Resume</font>
                                <p>
                                    <font size=4></font>
                                </p>
                            </h1>
                            <p>Enter Username and Password to submit your resume</p>

                            <form name="frm" action="u_resume.jsp" method="post" enctype="multipart/form-data">
                                <ul>
                                    <li>
                                        <label class="textbox" for="username">Username:</label>
                                        <input class="textbox" type="text" size="15" name="j_id" id="username">
                                    </li>
                                    <li>
                                        <label class="textbox" for="password">Password:</label>
                                        <input class="textbox" type="password" size="15" name="pass" id="password">
                                    </li>
                                    <li>
                                        <label class="textbox" for="resume">Select Resume(PDF only):</label>
                                        <input class="textbox" type="file" size="15" name="file" id="resume">
                                    </li>
                                    <li class="center">
                                        <input type="submit" value="Upload">
                                    </li>
                                </ul>

                            </form>

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