<!DOCTYPE html>
<html>
<head>
    <title>Check Balance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f0f8ff;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #003366;
            margin-top: 20px;
        }
        .container {
            background-color: #e6f2ff;
            border: 1px solid #a3c2ff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            width: 300px;
            text-align: center;
        }
        p {
            font-size: 18px;
            color: #003366;
            margin: 10px 0;
        }
        .error {
            color: red;
        }
        button {
            padding: 10px 20px;
            border: 1px solid #004080;
            border-radius: 5px;
            background-color: #0073e6;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background-color: #005bb5;
        }
    </style>
</head>
<body>
    <h2>Check Balance</h2>
    <div class="container">
        <% 
            Double balance = (Double) request.getAttribute("balance");
            String error = (String) request.getAttribute("error");
        %>
        <% if (balance != null) { %>
            <p>Your current balance is: $<%= balance %></p>
        <% } else if (error != null) { %>
            <p class="error"><%= error %></p>
        <% } %>
        <button type="button" onclick="window.location.href='customerDashboard.jsp'">Back to Dashboard</button>
    </div>
</body>
</html>
