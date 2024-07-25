<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.example.util.DBUtil"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Tasks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4ecd8; /* Light sandal color */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #8b4513; /* Dark brown color for heading */
            margin-bottom: 20px;
            font-size: 2em; /* Font size adjusted */
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        .table-container {
            width: 80%;
            max-width: 1000px;
            margin-bottom: 20px;
            overflow-x: auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #8b4513;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #8b4513;
            color: white;
        }

        td {
            background-color: #ffffff;
        }

        td:nth-child(odd) {
            background-color: #f9f9f9;
        }

        .button-container {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        button {
            padding: 10px 20px;
            background-color: #8b4513; /* Dark brown color for buttons */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #5a2c0c; /* Darker brown for hover effect */
        }

        form {
            display: inline;
        }

        .actions {
            display: flex;
            gap: 10px;
        }

    </style>
    <script>
        function goBack() {
            window.location.href = 'addTask.jsp';
        }

        function viewEmployeeChart() {
            window.location.href = 'adminCharts.jsp';
        }
    </script>
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
                out.println("<div class='table-container'>");
                out.println("<table>");
                out.println("<tr><th>User ID</th><th>Task ID</th><th>Date</th><th>Start Time</th><th>End Time</th><th>Category</th><th>Description</th><th>Actions</th></tr>");
                do {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("user_id") + "</td>");
                    out.println("<td>" + rs.getInt("task_id") + "</td>");
                    out.println("<td>" + rs.getDate("date") + "</td>");
                    out.println("<td>" + rs.getTime("start_time") + "</td>");
                    out.println("<td>" + rs.getTime("end_time") + "</td>");
                    out.println("<td>" + rs.getString("category") + "</td>");
                    out.println("<td>" + rs.getString("description") + "</td>");
                    out.println("<td class='actions'>");
                    out.println("<form action='editTask.jsp' method='get'>");
                    out.println("<input type='hidden' name='task_id' value='" + rs.getInt("task_id") + "'>");
                    out.println("<input type='hidden' name='user_id' value='" + rs.getInt("user_id") + "'>");
                    out.println("<input type='submit' value='Edit'>");
                    out.println("</form>");
                    out.println("<form action='deleteTask.jsp' method='post' onsubmit='return confirm(\"Are you sure you want to delete this task?\");'>");
                    out.println("<input type='hidden' name='task_id' value='" + rs.getInt("task_id") + "'>");
                    out.println("<input type='hidden' name='user_id' value='" + rs.getInt("user_id") + "'>");
                    out.println("<input type='submit' value='Delete'>");
                    out.println("</form>");
                    out.println("</td>");
                    out.println("</tr>");
                } while (rs.next());
                out.println("</table>");
                out.println("</div>");
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
    <div class="button-container">
        <button onclick="goBack()">Go Back</button>
        <button onclick="viewEmployeeChart()">View Employee Chart</button>
    </div>
</body>
</html>
