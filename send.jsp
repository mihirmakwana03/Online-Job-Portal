<%--<jsp:include page="page.html" />--%>
<html>

    <head></head>

    <body bgcolor=orange>
    <center>
        <font size=6><b>
            <%@page import="java.sql.*" %>
            <%@page import="java.io.*" %>
            <%!
                int k = 0;
                String email, j_id, fname, e_id, email2;
            %>
            <%
                email = request.getParameter("area");
                session = request.getSession(true);
                e_id = (String) session.getAttribute("e_id");
                email2 = (String) session.getAttribute("email");
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                    PreparedStatement pstm = con.prepareStatement(" select f_name,j_id,email from seek_det where email ='" + email + "'  ");

                    ResultSet res = pstm.executeQuery();
                    if (res.next()) {
                        fname = res.getString(1);
                        j_id = res.getString(2);
                        email = res.getString(3);
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                        PreparedStatement pstm1 = con1.prepareStatement("insert into seek_inbox values( ?,  ?,  ?,  ?,  ?)");
                        pstm1.setString(1, j_id);
                        pstm1.setString(2, fname);
                        pstm1.setString(3, email);
                        pstm1.setString(4, e_id);
                        pstm1.setString(5, email2);
                        int k1 = pstm1.executeUpdate();
                        out.println("Job details sent successfully!");
                    } else {
                        out.println("Data does not exist in database");
                    }
                } catch (SQLException e) {
                    out.println("Error of SQL" + e.getMessage());
                } catch (ClassNotFoundException e1) {
                    out.println("Error of Class" + e1.getMessage());
                } catch (IOException e2) {
                    out.println("Error of IO" + e2.getMessage());
                }
            %>
        </b></font>
    </center>
</body>

</html>
