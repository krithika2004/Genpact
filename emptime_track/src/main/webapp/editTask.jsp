<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.example.util.DBUtil"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Task</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4ecd8; /* Light sandal color */
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            color: #8b4513; /* Dark brown color for heading */
            font-size: 2em;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
        }

        input[type="text"], input[type="date"], input[type="time"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Ensures padding and border are included in the element's total width and height */
        }

        textarea {
            height: 100px;
            resize: none;
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #8b4513; /* Dark brown color for button */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #5a2c0c; /* Darker brown for hover effect */
        }

        p {
            color: #8b4513;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <div>
        <h1>Edit Task</h1>
        <%
            String taskIdParam = request.getParameter("task_id");
            String userIdParam = request.getParameter("user_id");

            if (taskIdParam == null || taskIdParam.trim().isEmpty() || userIdParam == null || userIdParam.trim().isEmpty()) {
                out.println("<p>Task ID or User ID not provided.</p>");
                return;
            }

            int taskId;
            int userId;
            try {
                taskId = Integer.parseInt(taskIdParam);
                userId = Integer.parseInt(userIdParam);
            } catch (NumberFormatException e) {
                out.println("<p>Invalid Task ID or User ID format.</p>");
                return;
            }

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String role = "", date = "", startTime = "", endTime = "", category = "", description = "";

            try {
                conn = DBUtil.getConnection();
                String querySql = "SELECT * FROM tasks WHERE task_id = ?";
                stmt = conn.prepareStatement(querySql);
                stmt.setInt(1, taskId);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    role = rs.getString("role");
                    date = rs.getDate("date").toString();
                    startTime = rs.getTime("start_time").toString();
                    endTime = rs.getTime("end_time").toString();
                    category = rs.getString("category");
                    description = rs.getString("description");
                } else {
                    out.println("<p>Task not found.</p>");
                    return;
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
                return;
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
        <form action="editTask.jsp" method="post">
            <input type="hidden" name="task_id" value="<%= taskId %>">
            <input type="hidden" name="user_id" value="<%= userId %>">
            
            <label for="role">Role:</label>
            <input type="text" id="role" name="role" value="<%= role %>" required>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="<%= date %>" required>

            <label for="start_time">Start Time:</label>
            <input type="time" id="start_time" name="start_time" value="<%= startTime.substring(0,5) %>" required>

            <label for="end_time">End Time:</label>
            <input type="time" id="end_time" name="end_time" value="<%= endTime.substring(0,5) %>" required>

            <label for="category">Category:</label>
            <input type="text" id="category" name="category" value="<%= category %>" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required><%= description %></textarea>

            <input type="submit" value="Update Task">
        </form>
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                try {
                    role = request.getParameter("role");
                    date = request.getParameter("date");
                    startTime = request.getParameter("start_time");
                    endTime = request.getParameter("end_time");
                    category = request.getParameter("category");
                    description = request.getParameter("description");

                    conn = DBUtil.getConnection();
                    String updateSql = "UPDATE tasks SET role = ?, date = ?, start_time = ?, end_time = ?, category = ?, description = ? WHERE task_id = ?";
                    stmt = conn.prepareStatement(updateSql);
                    stmt.setString(1, role);
                    stmt.setDate(2, Date.valueOf(date));
                    stmt.setTime(3, Time.valueOf(startTime + ":00"));
                    stmt.setTime(4, Time.valueOf(endTime + ":00"));
                    stmt.setString(5, category);
                    stmt.setString(6, description);
                    stmt.setInt(7, taskId);

                    int rowsUpdated = stmt.executeUpdate();
                    if (rowsUpdated > 0) {
                        response.sendRedirect("viewTasks.jsp?user_id=" + userId);
                    } else {
                        out.println("<p>Error updating task.</p>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            }
        %>
    </div>
</body>
</html>
