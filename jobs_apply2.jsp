<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apply Job</title>
    </head>
    <body>

        <h1>Apply Job</h1>

        <%@ page import="java.sql.*" %>

        <%
            String job_id = request.getParameter("job_id");
            String j_id = request.getParameter("j_id");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement stmt3 = con3.prepareStatement("select * from jobs_applied where job_id=" + job_id + " and j_id='" + j_id + "'");
                ResultSet res = stmt3.executeQuery();
//                res.getString(1);
//                res.getString(2);
//                res.getString(3);
//                res.getString(4);
                if (res.next()) {
        %>
        <script>
            alert("You already applied to this job");
        </script>
        <%
        } else {

            Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
            PreparedStatement stmt4 = con4.prepareStatement("INSERT INTO jobs_applied VALUES (?,?,?,?)");
            stmt4.setString(1, null);
            stmt4.setString(2, job_id);
            stmt4.setString(3, j_id);
            stmt4.setString(4, "pending");

            int k4 = stmt4.executeUpdate();
        %>
        <script>
            alert("Job Applied Successfully");
            window.location.href = 'jobs.jsp';
        </script>
        <%
                }
            } catch (SQLException e) {
                out.println("SQLException " + e.getMessage());
            } catch (ClassNotFoundException e1) {
                out.println("ClassNotFoundException " + e1.getMessage());
            }
        %>

    </body>
</html>
