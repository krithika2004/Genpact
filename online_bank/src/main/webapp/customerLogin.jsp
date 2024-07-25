<!DOCTYPE html>
<html>
<head>
    <title>Customer Login</title>
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
            margin-bottom: 20px;
        }

        .login-container {
            background-color: #e6f2ff;
            border: 1px solid #a3c2ff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #a3c2ff;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            padding: 10px 20px;
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

        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Customer Login</h2>
        <form action="CustomerLoginServlet" method="post">
            <input type="text" name="account_no" placeholder="Account Number" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
            <c:if test="${not empty param.error}">
                <p class="error">${param.error}</p>
            </c:if>
        </form>
    </div>
</body>
</html>
