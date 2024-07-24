<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Selection</title>
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

        .login-container {
            display: flex;
            justify-content: space-around;
            width: 80%;
            margin-top: 20px;
        }

        .login-box {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 45%;
            text-align: center;
        }

        input[type="button"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function redirectTo(page) {
            window.location.href = page;
        }
    </script>
</head>
<body>
    <h1>Login Selection</h1>
    <div class="login-container">
        <div class="login-box">
            <h2>Employee Login</h2>
            <input type="button" value="Employee Login" onclick="redirectTo('employeelogin.jsp')">
        </div>
        <div class="login-box">
            <h2>Manager Login</h2>
            <input type="button" value="Manager Login" onclick="redirectTo('managerlogin.jsp')">
        </div>
    </div>
</body>
</html>
