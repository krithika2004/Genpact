<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Enter User ID</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4ecd8; /* Light sandal color */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            color: #8b4513; /* Dark brown color for heading */
            font-size: 2em;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            color: #000; /* Bold black text */
        }

        input[type="text"] {
            padding: 8px;
            border: 1px solid #8b4513;
            border-radius: 4px;
            margin-top: 5px;
            width: 100%;
            max-width: 300px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #8b4513; /* Dark brown color for buttons */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #5a2c0c; /* Darker brown for hover effect */
        }
    </style>
</head>
<body>
    <form action="employeeViewTasks.jsp" method="get">
        <h1>Enter User ID to View Tasks</h1>
        <label for="user_id">User ID:</label>
        <input type="text" id="user_id" name="user_id" required><br>
        <input type="submit" value="View Tasks">
    </form>
</body>
</html>
