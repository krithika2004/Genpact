<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Task</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <h1>Edit Task</h1>
    <form action="TaskServlet" method="post">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="taskId" value="<%= request.getParameter("taskId") %>">
        <label for="username">user name:</label>
        <input type="text" id="username" name="username" value="<%= request.getParameter("username") %>" required><br>
        <label for="role">Role:</label>
        <input type="text" id="role" name="role" value="<%= request.getParameter("role") %>" required><br>
        
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" value="<%= request.getParameter("date") %>" required><br>
        <label for="startTime">Start Time:</label>
        <input type="time" id="startTime" name="startTime" value="<%= request.getParameter("startTime") %>" required><br>
        <label for="endTime">End Time:</label>
        <input type="time" id="endTime" name="endTime" value="<%= request.getParameter("endTime") %>" required><br>
        <label for="category">Category:</label>
        <input type="text" id="category" name="category" value="<%= request.getParameter("category") %>" required><br>
        <label for="description">Description:</label>
        <textarea id="description" name="description" required><%= request.getParameter("description") %></textarea><br>
        <input type="submit" value="Edit Task">
    </form>
</body>
</html>
