<jsp:include page="blank.html" />
<html>

    <head></head>

    <body>
        <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
        <%! String job_id, c_name, email, addr1, city, req, country, j_cat, q_id, key, no_vac, e_id, skills, j_id, seek_email;%>
        <% j_id = request.getParameter("j_id");
            seek_email = request.getParameter("email");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement pstm = con.prepareStatement(" select * from seek_det where j_id='" + j_id + "' ");
                ResultSet res = pstm.executeQuery();
                while (res.next()) {
                    seek_email = res.getString(2);
                    session.setAttribute(j_id, seek_email);
                    out.println(" <form action=seek_mail.jsp?j_id=" + j_id + " &email=" + seek_email + " method=post>");

                }
            } catch (SQLException e) {

            } catch (ClassNotFoundException e1) {

            } catch (IOException e2) {
            }
        %>
        <form action="seek_mail.jsp?j_id=<%=j_id%>&email=<%=seek_email%>" method="post">
            <table border="1" width="100%" align="center">
                <caption>Vacancies Avaliable</caption>
                <tr>

                    <th>Email-id</th>
                    <th>Job Category</th>
                    <th>No. of Seats Vacant</th>
                    <th>Qualification req</th>
                    <th>Address</th>
                    <th>Skills Required</th>
                    <th>Option Select</th>

                </tr>

                <% key = request.getParameter("search");
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                        PreparedStatement pstm = con.prepareStatement(" select * from vacancy where skills='" + key + "' ");
                        ResultSet res = pstm.executeQuery();
                        while (res.next()) {
                            job_id = res.getString(1);
                            c_name = res.getString(2);
                            e_id = res.getString(3);
                            j_cat = res.getString(4);
                            no_vac = res.getString(5);
                            q_id = res.getString(6);
                            req = res.getString(7);
                            addr1 = res.getString(8);
                            city = res.getString(9);
                            country = res.getString(10);
                            skills = res.getString(11);
                            email = res.getString(12);
                            out.println("<tr><td>" + email + "</td><td>" + j_cat + "</td><td>" + no_vac + "</td><td>" + q_id + "</td><td>" + addr1 + ", " + city + ", " + country + "</td><td>" + skills + "</td><td><input type=checkbox name = seek_search selected value=yes checked></tr>");
                        }

                    } catch (SQLException e) {
                        out.println("Error of SQL" + e);
                    } catch (ClassNotFoundException e1) {
                    } catch (IOException e2) {
                    }


                %>
                <center><input type=submit value="Send Request"></center>
        </form>
    </table>
</body>

</html>