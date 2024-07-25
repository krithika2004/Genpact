<!DOCTYPE html>
<html>
<head>
    <title>Deposit</title>
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

        .container {
            background-color: #e6f2ff;
            border: 1px solid #a3c2ff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        input[type="number"] {
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

        .success {
            color: green;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Deposit</h2>
        <form action="DepositServlet" method="post">
            <input type="number" name="amount" placeholder="Amount" required>
            <button type="submit">Deposit</button>
            <c:if test="${not empty param.message}">
                <p class="success">${param.message}</p>
            </c:if>
        </form>
    </div>
</body>
</html>
