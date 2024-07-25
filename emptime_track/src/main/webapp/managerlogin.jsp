<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manager Login</title>
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
            margin-bottom: 20px;
            color: #ff6f00; /* Interactive color for heading */
            font-size: 2.5em;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        .login-box {
            background-color: #fff;
            padding: 30px;
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
        input[type="password"] {
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
            background-color: #8b4513; /* Brown color for buttons */
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
