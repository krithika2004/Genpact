<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.example.util.DBUtil"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Tasks</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>View Tasks</h1>
    <%
        String userIdParam = request.getParameter("user_id");
        if (userIdParam == null || userIdParam.trim().isEmpty()) {
            out.println("<p>No User ID provided.</p>");
            return;
        }

        int userId;
        try {
            userId = Integer.parseInt(userIdParam);
        } catch (NumberFormatException e) {
            out.println("<p>Invalid User ID format.</p>");
            return;
        }

        // Validate that the user ID is one of the allowed values
        if (userId != 1 && userId != 2 && userId != 3 && userId != 25) {
            out.println("<p>Invalid User ID. You can only view tasks for user IDs: 1, 2, 3, 25.</p>");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String querySql = "SELECT * FROM tasks WHERE user_id = ?";
            stmt = conn.prepareStatement(querySql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                out.println("<table>");
                out.println("<tr><th>User ID</th><th>Task ID</th><th>Date</th><th>Start Time</th><th>End Time</th><th>Category</th><th>Description</th></tr>");
                do {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("user_id") + "</td>");
                    out.println("<td>" + rs.getInt("task_id") + "</td>");
                    out.println("<td>" + rs.getDate("date") + "</td>");
                    out.println("<td>" + rs.getTime("start_time") + "</td>");
                    out.println("<td>" + rs.getTime("end_time") + "</td>");
                    out.println("<td>" + rs.getString("category") + "</td>");
                    out.println("<td>" + rs.getString("description") + "</td>");
                    out.println("</tr>");
                } while (rs.next());
                out.println("</table>");
            } else {
                out.println("<p>No tasks found for User ID: " + userId + "</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</body>
</html>
