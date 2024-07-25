<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.example.util.DBUtil"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee View Tasks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4ecd8; /* Light sandal color */
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #8b4513; /* Dark brown color for heading */
            font-size: 2em;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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

        input[type="submit"], button {
            padding: 10px 20px;
            background-color: #8b4513; /* Dark brown color for buttons */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-top: 20px;
            margin-right: 10px;
        }

        input[type="submit"]:hover, button:hover {
            background-color: #5a2c0c; /* Darker brown for hover effect */
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .centered-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="centered-container">
        <h1>Employee View Tasks</h1>
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
                    out.println("<form action='employeeViewTasks.jsp' method='post'>");
                    out.println("<input type='hidden' name='user_id' value='" + userId + "'>");
                    out.println("<table>");
                    out.println("<tr><th>Task ID</th><th>Date</th><th>Start Time</th><th>End Time</th><th>Category</th><th>Description</th><th>Completed</th></tr>");
                    do {
                        int taskId = rs.getInt("task_id");
                        boolean isCompleted = rs.getBoolean("completed");
                        out.println("<tr>");
                        out.println("<td>" + taskId + "</td>");
                        out.println("<td>" + rs.getDate("date") + "</td>");
                        out.println("<td>" + rs.getTime("start_time") + "</td>");
                        out.println("<td>" + rs.getTime("end_time") + "</td>");
                        out.println("<td>" + rs.getString("category") + "</td>");
                        out.println("<td>" + rs.getString("description") + "</td>");
                        out.println("<td><input type='checkbox' name='task_" + taskId + "' value='completed'" + (isCompleted ? " checked" : "") + "></td>");
                        out.println("</tr>");
                    } while (rs.next());
                    out.println("</table>");
                    out.println("<input type='submit' value='Update Completion Status'>");
                    out.println("</form>");
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
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                userIdParam = request.getParameter("user_id");
                if (userIdParam != null && !userIdParam.trim().isEmpty()) {
                    try {
                        userId = Integer.parseInt(userIdParam);

                        conn = DBUtil.getConnection();
                        String querySql = "SELECT task_id FROM tasks WHERE user_id = ?";
                        stmt = conn.prepareStatement(querySql);
                        stmt.setInt(1, userId);
                        rs = stmt.executeQuery();

                        while (rs.next()) {
                            int taskId = rs.getInt("task_id");
                            boolean isCompleted = request.getParameter("task_" + taskId) != null;

                            String updateSql = "UPDATE tasks SET completed = ? WHERE task_id = ?";
                            PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                            updateStmt.setBoolean(1, isCompleted);
                            updateStmt.setInt(2, taskId);
                            updateStmt.executeUpdate();
                            updateStmt.close();
                        }
                        out.println("<p>Task completion status updated successfully.</p>");
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                }
            }
        %>
        <div class="button-container">
            <button onclick="window.location.href='index.jsp';">Go Back</button>
            <button onclick="window.location.href='adminCharts.jsp';">view chart</button>
        </div>
    </div>
</body>
</html>
