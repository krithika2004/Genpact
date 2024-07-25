<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #f0f8ff;
            height: 100vh;
            margin: 0;
        }

        h2 {
            color: #003366;
            margin-top: 20px;
        }

        .container {
            background-color: #e6f2ff;
            border: 1px solid #a3c2ff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            margin-top: 20px;
        }

        .customer-dashboard {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
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
        }

        button:hover {
            background-color: #004d99;
        }

        form {
            margin: 0;
        }
    </style>
</head>
<body>
    <h2>Customer Dashboard</h2>
    <div class="container">
        <h3>Welcome ${sessionScope.full_name}</h3>
        <div class="customer-dashboard">
            <button onclick="location.href='deposit.jsp'">Deposit</button>
            <button onclick="location.href='withdraw.jsp'">Withdraw</button>
            <button onclick="location.href='CheckBalanceServlet'">Check Balance</button>
            <button onclick="location.href='TransactionHistoryServlet'">Transaction History</button>
            <form action="DeleteAccountServlet" method="post" onsubmit="return confirm('Are you sure you want to delete your account?');">
                <button type="submit">Delete Account</button>
            </form>
            <button onclick="location.href='LogoutServlet'">Logout</button>
        </div>
    </div>
</body>
</html>
