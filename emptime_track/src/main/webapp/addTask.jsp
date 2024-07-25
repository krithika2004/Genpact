<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.example.util.DBUtil"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Task</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4ecd8; /* Light sandal color */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            color: #8b4513; /* Dark brown color for heading */
            margin-bottom: 20px;
            font-size: 2em; /* Reduced size */
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="time"],
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            color: #000; /* Black color inside text boxes */
        }

        input[type="submit"],
        input[type="button"] {
            width: 100%;
            padding: 10px;
            background-color: #8b4513; /* Dark brown color for buttons */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1.1em;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #5a2c0c; /* Darker brown for hover effect */
        }

        input[type="button"] {
            margin-top: 10px;
        }
    </style>
    <script>
        function goBack() {
            window.location.href = 'index.jsp';
        }
    </script>
</head>
<body>
    <h1>Add Task</h1>
    <div class="form-container">
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
        <input type="button" value="Go Back" onclick="goBack()">
    </div>
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
