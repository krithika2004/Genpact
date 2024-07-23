<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f8ff;
            margin: 0;
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
        }
        h3 {
            text-align: center;
            color: #003366;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        input, select, button {
            padding: 10px;
            border: 1px solid #a3c2ff;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            background-color: #0066cc;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background-color: #004d99;
        }
        .success {
            color: green;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Admin Dashboard</h2>
    <div class="container">
        <h3>Register Customer</h3>
        <form action="RegisterCustomerServlet" method="post">
            <input type="text" name="full_name" placeholder="Full Name" required>
            <input type="text" name="address" placeholder="Address" required>
            <input type="text" name="mobile_no" placeholder="Mobile No" required>
            <input type="email" name="email_id" placeholder="Email ID" required>
            <select name="account_type" required>
                <option value="Saving">Saving Account</option>
                <option value="Current">Current Account</option>
            </select>
            <input type="number" name="initial_balance" placeholder="Initial Balance" min="1000" required>
            <input type="date" name="dob" required>
            <input type="text" name="id_proof" placeholder="ID Proof" required>
            <button type="submit">Register</button>
            <c:if test="${not empty param.success}">
                <p class="success">${param.success}</p>
            </c:if>
        </form>
        <button onclick="location.href='LogoutServlet'">Logout</button>
    </div>
</body>
</html>
