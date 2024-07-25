<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f8ff;
            height: 100vh;
            margin: 0;
        }

        h2 {
            color: #003366;
            margin-bottom: 40px;
             text-align: center;
        }

        .login-container {
            background-color: #e6f2ff;
            border: 1px solid #a3c2ff;
            border-radius: 10px;
            padding: 30px 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .login-container h3 {
            margin-bottom: 20px;
            color: #003366;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #a3c2ff;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            padding: 12px 20px;
            border: 1px solid #a3c2ff;
            border-radius: 5px;
            background-color: #0066cc;
            color: white;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        button:hover {
            background-color: #004d99;
        }

        p a {
            color: #0066cc;
            text-decoration: none;
            font-size: 14px;
        }

        p a:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div>
        <h2>   Bank Management System  </h2>
        <div class="login-container">
            <form action="AdminLoginServlet" method="post">
                <h3>Admin Login</h3>
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">Login</button>
                <p><a href="customerLogin.jsp">Customer Login</a></p>
                <c:if test="${not empty param.error}">
                    <p class="error">${param.error}</p>
                </c:if>
            </form>
        </div>
    </div>
</body>
</html>
