<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.example.util.TaskDataUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin View Employee Tasks</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            font-size: 2em;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }

        label {
            margin: 10px 0;
            font-weight: bold;
            color: #000; /* Bold black text */
        }

        input[type="text"], select {
            padding: 8px;
            border: 1px solid #8b4513;
            border-radius: 4px;
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
            margin-top: 10px;
        }

        input[type="submit"]:hover, button:hover {
            background-color: #5a2c0c; /* Darker brown for hover effect */
        }

        canvas {
            width: 600px !important;
            height: 400px !important;
            margin-top: 20px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
    </style>
</head>
<body>
    <h1>Admin View Employee Tasks</h1>
    <form action="adminCharts.jsp" method="get">
        <label for="user_id">User ID:</label>
        <input type="text" id="user_id" name="user_id" required><br>
        <label for="type">Chart Type:</label>
        <select id="type" name="type" required>
            <option value="daily">Daily</option>
            <option value="weekly">Weekly</option>
            <option value="monthly">Monthly</option>
        </select><br>
        <input type="submit" value="View Chart">
    </form>
    <%
        String userIdParam = request.getParameter("user_id");
        String type = request.getParameter("type");

        if (userIdParam != null && !userIdParam.trim().isEmpty() && type != null && !type.trim().isEmpty()) {
            int userId;
            try {
                userId = Integer.parseInt(userIdParam);
            } catch (NumberFormatException e) {
                out.println("<p>Invalid User ID format.</p>");
                return;
            }

            List<Map<String, Object>> taskData;
            try {
                taskData = TaskDataUtil.getTaskData(userId, type);
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error fetching data: " + e.getMessage() + "</p>");
                return;
            }

            if (taskData.isEmpty()) {
                out.println("<p>No data found for the selected criteria.</p>");
            } else {
                StringBuilder labels = new StringBuilder();
                StringBuilder data = new StringBuilder();
                StringBuilder colors = new StringBuilder();

                for (Map<String, Object> dataPoint : taskData) {
                    labels.append("'").append(dataPoint.get("label")).append("',");
                    data.append(dataPoint.get("duration")).append(",");
                    colors.append("'rgba(").append((int)(Math.random() * 255)).append(", ")
                          .append((int)(Math.random() * 255)).append(", ")
                          .append((int)(Math.random() * 255)).append(", 0.2)',");
                }
                if (labels.length() > 0) {
                    labels.setLength(labels.length() - 1); // Remove trailing comma
                }
                if (data.length() > 0) {
                    data.setLength(data.length() - 1); // Remove trailing comma
                }
                if (colors.length() > 0) {
                    colors.setLength(colors.length() - 1); // Remove trailing comma
                }
    %>
                <canvas id="taskChart"></canvas>
                <script>
                    var ctx = document.getElementById('taskChart').getContext('2d');
                    var chartType = '<%= "daily".equals(type) ? "pie" : "bar" %>';
                    var chart = new Chart(ctx, {
                        type: chartType,
                        data: {
                            labels: [<%= labels.toString() %>],
                            datasets: [{
                                label: 'Task Duration (hours)',
                                data: [<%= data.toString() %>],
                                backgroundColor: [<%= colors.toString() %>],
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                </script>
    <%
            }
        }
    %>
    <div class="button-container">
        <button onclick="window.location.href='index.jsp';">Go Back</button>
    </div>
</body>
</html>
