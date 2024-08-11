<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%
    String e_id = request.getParameter("e_id");
    String password = request.getParameter("pwd");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try ( Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");  PreparedStatement pstmt = con.prepareStatement("SELECT * FROM emp_login WHERE e_id=? AND password=?")) {
            pstmt.setString(1, e_id);
            pstmt.setString(2, password);
            try ( ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {

                    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                    PreparedStatement pstmt2 = con2.prepareStatement("SELECT * FROM emp_det WHERE e_id=?");
                    {
                        pstmt2.setString(1, e_id);
                        ResultSet res2 = pstmt2.executeQuery();
                        if (res2.next()) {
                            String email = res2.getString(2);
                            session.setAttribute("e_id", e_id);
                            session.setAttribute("email", email);
                            response.sendRedirect("emp_profile.jsp?e_id=" + e_id + " &email=" + email);
                        }
                    }
                } else {
                    out.println("Data does not exist in database");
                }
            }
        }
    } catch (SQLException e) {
        out.println("SQL error: " + e.getMessage());
    } catch (ClassNotFoundException e) {
        out.println("Class not found error: " + e.getMessage());
    } catch (IOException e) {
        out.println("IO error: " + e.getMessage());
    }
%>
