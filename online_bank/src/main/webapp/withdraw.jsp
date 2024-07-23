<!DOCTYPE html>
<html>
<head>
    <title>Withdraw</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #d0e7ff;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #003366;
            margin-bottom: 20px;
        }

        .container {
            background-color: #b3daff;
            border: 1px solid #80c1ff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        input[type="number"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #80c1ff;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #00509e;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
            width: 100%;
        }

        button:hover {
            background-color: #003d80;
        }

        p.success {
            color: green;
            font-size: 14px;
            margin-top: 10px;
        }

        p.error {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h2>Withdraw</h2>
    <div class="container">
        <form action="WithdrawServlet" method="post">
            <input type="number" name="amount" placeholder="Amount" required>
            <button type="submit">Withdraw</button>
            <c:if test="${not empty param.message}">
                <p class="success">${param.message}</p>
            </c:if>
            <c:if test="${not empty param.error}">
                <p class="error">${param.error}</p>
            </c:if>
        </form>
    </div>
</body>
</html>
