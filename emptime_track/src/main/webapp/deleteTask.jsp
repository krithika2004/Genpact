<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Task</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <h1>Delete Task</h1>
    <form action="TaskServlet" method="post">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="taskId" value="<%= request.getParameter("taskId") %>">
        <p>Are you sure you want to delete the task?</p>
        <input type="submit" value="Delete Task">
    </form>
</body>
</html>
