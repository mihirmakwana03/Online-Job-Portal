<html>

    <head></head>

    <body bgcolor="orange">
        <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
        <%! String e_id, email2;%>
        <% e_id = request.getParameter("e_id");
            email2 = request.getParameter("email");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                PreparedStatement pstm = con.prepareStatement(" select * from emp_det where e_id='" + e_id + "' ");
                ResultSet res = pstm.executeQuery();
                while (res.next()) {
                    session.putValue(e_id, email2);
                    out.println(" <form action=jobcat_search.jsp?e_id=" + e_id + " &email=" + email2 + " method=post>");

                }
            } catch (SQLException e) {

            } catch (ClassNotFoundException e1) {

            } catch (IOException e2) {
            }
        %>

    <center>
        <p>
            <font size=8 color=green><I>Enter the job category:</I></font>
        </p>
        <p>
            <select name="category" value="">
                <option value="IT">IT</option>
                <option value="finance">Finance</option>
                <option value="sales">Sales</option>
                <option value="marketing">Marketing</option>
            </select>
        </p>

        <p><input type="submit" value="Start Search"></p>
    </form>
</center>

</body>

</html>