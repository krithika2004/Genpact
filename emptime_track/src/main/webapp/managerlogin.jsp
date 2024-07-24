<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manager Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            margin-top: 50px;
        }

        .login-box {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function goBack() {
            window.location.href = 'index.jsp';
        }
    </script>
</head>
<body>
    <h1>Manager Login</h1>
    <div class="login-box">
        <form action="AuthServlet" method="post">
            <label for="manager-username">Username:</label>
            <input type="text" id="manager-username" name="username" required><br>
            <label for="manager-password">Password:</label>
            <input type="password" id="manager-password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
        <input type="button" value="Go Back" onclick="goBack()">
    </div>
</body>
</html>
