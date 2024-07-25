package com.bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterCustomerServlet")
public class RegisterCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobile_no");
        String emailId = request.getParameter("email_id");
        String accountType = request.getParameter("account_type");
        String initialBalance = request.getParameter("initial_balance");
        String dob = request.getParameter("dob");
        String idProof = request.getParameter("id_proof");
        String password = "temp123"; // Temporary password

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "Krithi@2004");

            PreparedStatement ps = con.prepareStatement("INSERT INTO customer (full_name, address, mobile_no, email_id, account_type, initial_balance, dob, id_proof, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, mobileNo);
            ps.setString(4, emailId);
            ps.setString(5, accountType);
            ps.setString(6, initialBalance);
            ps.setString(7, dob);
            ps.setString(8, idProof);
            ps.setString(9, password);
            ps.executeUpdate();

            response.sendRedirect("adminDashboard.jsp?success=Customer registered successfully");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}