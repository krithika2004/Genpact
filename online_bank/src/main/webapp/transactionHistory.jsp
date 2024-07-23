<%@ page import="java.util.List" %>
<%@ page import="com.bank.Transaction" %>

<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
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
            background-color: #e6f2ff;
            border: 1px solid #a3c2ff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #a3c2ff;
            text-align: center;
        }

        th {
            background-color: #0066cc;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #0066cc;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #004d99;
        }
    </style>
</head>
<body>
    <h2>Transaction History</h2>
    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>Account No</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                    if (transactions != null && !transactions.isEmpty()) {
                        for (Transaction transaction : transactions) {
                %>
                <tr>
                    <td><%= transaction.getTransactionId() %></td>
                    <td><%= transaction.getAccountNo() %></td>
                    <td><%= transaction.getType() %></td>
                    <td><%= transaction.getAmount() %></td>
                    <td><%= transaction.getDate() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5">No transactions found.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <a href="customerDashboard.jsp">Back to Dashboard</a>
</body>
</html>
