<jsp:include page="blank.html" />
<html>

    <head></head>

    <body>
        <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
        <%! String exp, j_id, j_cat, type, city, country, email, e_id, email2;%>

        <table border="1" width="100%" align="center">
            <caption>Job Aspirants</caption>
            <tr>
                <th>Employee-Id</th>
                <th>Job Category</th>
                <th>Job Type</th>
                <th>Experience</th>
                <th>Location</th>
                <th>Email-Id</th>


            </tr>

            <% j_cat = request.getParameter("category");
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                    PreparedStatement pstm = con.prepareStatement(" select * from experience where job_cat='" + j_cat + "' ");
                    ResultSet res = pstm.executeQuery();
                    while (res.next()) {
                        j_id = res.getString(1);
                        j_cat = res.getString(2);
                        type = res.getString(3);
                        exp = res.getString(4);
                        city = res.getString(8);
                        country = res.getString(9);
                        email = res.getString(10);
                        out.println("<tr><td>" + j_id + "</td><td>" + j_cat + "</td><td>" + type + "</td><td>" + exp + "</td><td>" + city + "," + country + "</td><td>" + email + "</td></tr>");
                    }

                } catch (SQLException e) {
                    out.println("Error of SQL" + e);
                } catch (ClassNotFoundException e1) {
                } catch (IOException e2) {
                }
            %>

        </table>
    </body>

</html>