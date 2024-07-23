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
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("account_no");

        if (accountNo == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "Krithi@2004");

            PreparedStatement ps1 = con.prepareStatement("DELETE FROM transactions WHERE account_no = ?");
            ps1.setString(1, accountNo);
            ps1.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement("DELETE FROM customer WHERE account_no = ?");
            ps2.setString(1, accountNo);
            ps2.executeUpdate();

            session.invalidate();
            response.sendRedirect("login.jsp?message=Account deleted successfully");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("customerDashboard.jsp?error=Unable to delete account");
        }
    }
}