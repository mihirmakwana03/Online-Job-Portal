<html>

<head></head>

<body bgcolor=orange>
    <center>
        <font size=6 color=green><I><b>Send application to the following mail-id:</b></I></font>
    </center>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%@page import="java.net.*" %>
    <% 
        session = request.getSession(true);
        String j_id = (String) session.getAttribute("j_id");
        String seek_email = (String) session.getAttribute("seek_email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
            PreparedStatement pstm = con.prepareStatement(" select * from seek_det where j_id='" + j_id + "' and email='" + seek_email + "' ");
            ResultSet res = pstm.executeQuery();
            while (res.next()) {
                session.setAttribute("j_id", j_id);
                session.setAttribute("seek_email", seek_email);
                out.println("<form action=\"seek_send.jsp?j_id=" + j_id + "&seek_email=" + seek_email + "\" method=\"post\">");


            }
        } catch (SQLException e) {
            out.println(e.getMessage());
        } catch (ClassNotFoundException e1) {
            out.println(e1.getMessage());
        } catch (IOException e2) {
            out.println(e2.getMessage());
        }
    %>
    <center>
        <textarea rows=8 cols=25 name="area"></textarea>
        <p><input type=submit value="SEND REQUEST"></p>
    </center>
    </form>
</body>

</html>
