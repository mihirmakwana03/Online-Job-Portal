<%--<jsp:include page="page.html" />--%>
<html>

    <head></head>

    <body>
        <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
        <%! String j_id, password;%>
        <% j_id = request.getParameter("j_id");
            password = request.getParameter("pwd");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root",
                        "");
                PreparedStatement pstm = con.prepareStatement(" select * from seek_login where j_id ='" + j_id + "'  and pwd='" + password + "'  ");

                ResultSet res = pstm.executeQuery();
                if (res.next()) {
                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                    PreparedStatement pstmt2 = con2.prepareStatement("SELECT * FROM seek_det WHERE j_id=?");
                    {
                        pstmt2.setString(1, j_id);
                        ResultSet res2 = pstmt2.executeQuery();
                        if (res2.next()) {
                            String email = res2.getString(2);
                            session.setAttribute("j_id", j_id);
                            session.setAttribute("email", email);
                            response.sendRedirect("seek_profile.jsp?j_id=" + j_id + " &email=" + email);
                        }
                    }
                } else {
                    out.println(" Data does not exist in database");
                }
            } catch (SQLException e) {
                out.println("Error of SQL " + e);
            } catch (ClassNotFoundException e1) {
            } catch (IOException e2) {
            }%>

    </body>

</html>