<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.example.util.DBUtil"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Task</title>
</head>
<body>
    <h1>Add Task</h1>
    <form action="addTask.jsp" method="post">
        <label for="user_id">User ID:</label>
        <input type="text" id="user_id" name="user_id" required><br>
        
        <label for="role">Role:</label>
        <input type="text" id="role" name="role" required><br>

        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required><br>

        <label for="start_time">Start Time:</label>
        <input type="time" id="start_time" name="start_time" required><br>

        <label for="end_time">End Time:</label>
        <input type="time" id="end_time" name="end_time" required><br>

        <label for="category">Category:</label>
        <input type="text" id="category" name="category" required><br>

        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea><br>

        <input type="submit" value="Add Task">
    </form>
    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                int userId = Integer.parseInt(request.getParameter("user_id"));
                String role = request.getParameter("role");
                Date date = Date.valueOf(request.getParameter("date"));
                Time startTime = Time.valueOf(request.getParameter("start_time") + ":00");
                Time endTime = Time.valueOf(request.getParameter("end_time") + ":00");
                String category = request.getParameter("category");
                String description = request.getParameter("description");

                conn = DBUtil.getConnection();

                // Validate the user ID and role
                String validateUserSql = "SELECT role FROM users WHERE user_id = ?";
                stmt = conn.prepareStatement(validateUserSql);
                stmt.setInt(1, userId);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    String userRole = rs.getString("role");

                    if (userRole.equals(role)) {
                        // Insert task if validation is successful
                        String insertSql = "INSERT INTO tasks (user_id, role, date, start_time, end_time, category, description) VALUES (?, ?, ?, ?, ?, ?, ?)";
                        stmt = conn.prepareStatement(insertSql);
                        stmt.setInt(1, userId);
                        stmt.setString(2, role);
                        stmt.setDate(3, date);
                        stmt.setTime(4, startTime);
                        stmt.setTime(5, endTime);
                        stmt.setString(6, category);
                        stmt.setString(7, description);

                        int rowsInserted = stmt.executeUpdate();
                        if (rowsInserted > 0) {
                            response.sendRedirect("viewTasks.jsp?user_id=" + userId);
                        } else {
                            out.println("<p>Error adding task.</p>");
                        }
                    } else {
                        out.println("<p>Role does not match the user ID.</p>");
                    }
                } else {
                    out.println("<p>User ID does not exist.</p>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>
</body>
</html>
