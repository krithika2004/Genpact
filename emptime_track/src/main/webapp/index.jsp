<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Selection</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f8f2; /* Light sandal or yellow color */
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 0;
            height: 100vh;
            justify-content: center;
        }

        h1 {
            color: #ff6f00; /* Dark orange color */
            margin-bottom: 40px;
            font-size: 2.5em;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        .login-container {
            display: flex;
            justify-content: center;
            width: 80%;
            max-width: 1200px;
            margin: 0 auto;
            gap: 20px; /* Space between the login boxes */
        }

        .login-box {
            background-color: #ffffff;
            padding: 30px;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 45%;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .login-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        h2 {
            color: #495057;
            margin-bottom: 20px;
            font-size: 1.8em;
            font-weight: 600;
        }

        input[type="button"] {
            width: 100%;
            padding: 15px;
            background-color: #ff6f00; /* Dark orange color */
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.2s;
        }

        input[type="button"]:hover {
            background-color: #e65c00; /* Slightly darker orange for hover effect */
            transform: scale(1.02);
        }
        
        input[type="button"]:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 111, 0, 0.5); /* Dark orange focus effect */
        }
    </style>
    <script>
        function redirectTo(page) {
            window.location.href = page;
        }
    </script>
</head>
<body>
    <h1>Login Section</h1>
    <div class="login-container">
        <div class="login-box" style="margin-right: auto;">
            <h2>Employee Login</h2>
            <input type="button" value="Employee Login" onclick="redirectTo('employeelogin.jsp')">
        </div>
        <div class="login-box" style="margin-left: auto;">
            <h2>Manager Login</h2>
            <input type="button" value="Manager Login" onclick="redirectTo('managerlogin.jsp')">
        </div>
    </div>
</body>
</html>
