/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package identity;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iftitakhul Zakiyah
 */
@WebServlet(name = "Token", urlPatterns = {"/Token"})
public class Token extends HttpServlet {

    public String randomToken() {
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[20];
		random.nextBytes(bytes);
		String token = bytes.toString();
		return token;
	}

	
	public static int getIdToken(String token) throws SQLException {
		//return id jika ada
		//return -1 jika expired
		//return 0 jika tidak ada di db
		String SQL = "SELECT * FROM identity-access NATURAL JOIN identity-service WHERE token = ?";
		
		String URL = "jdbc:msql://sql12.freemysqlhosting.net:3306/sql12203261";
		String user = "sql12203261";
		String pass = "Hq5tyJRtPn";
		
		Statement stmt = null;
		Connection conn = DriverManager.getConnection(URL);
                
		try {
			stmt = (Statement) conn.createStatement();
			
			PreparedStatement updateToken;
			updateToken = conn.prepareStatement(SQL);
			updateToken.executeUpdate();
			conn.commit();
//			stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(SQL);
			
			Timestamp current = new Timestamp(System.currentTimeMillis());
			
			int check = 0;
			int ID = 0;
			while(rs.next()) {
				ID = rs.getInt("id");
				Timestamp expiry_time = rs.getTimestamp("expiry-time");
				check++;
			}
			
			Calendar cal = Calendar.getInstance();
			cal.setTimeInMillis(current.getTime());
			cal.add(Calendar.SECOND, 60);
			Timestamp result = new Timestamp(cal.getTime().getTime());
			
			if(check == 0) {
				return check;
			} else {
				if(current.before(result)) {
					return ID;
				} else {
					return -1;
				}
			}
		} catch (SQLException ex) {
			System.out.println("SQL Execption : " + ex.getMessage());
			System.out.println("SQLState : " + ex.getSQLState());
			System.out.println("VendorError : " + ex.getErrorCode());
			return 9999;
		} finally {
			if(stmt != null ) {
                            conn.close();
			}
		}
	}
	
	public String getToken() throws SQLException{
		//panggil getId terus insert token yg di generate ke id itu terus ngembaliin token sama ID
		
		String URL = "jdbc:msql://sql12.freemysqlhosting.net:3306/sql12203261";
		String user = "sql12203261";
		String pass = "Hq5tyJRtPn";
		String SQL = "INSERT INTO identity-access (ID, token) VALUES (?,?)";
		Statement stmt = null;
		Connection conn = DriverManager.getConnection(URL);
                
		try {	
			stmt = (Statement) conn.createStatement();
			
			String token = randomToken();
			int ID = getIdToken(token);
			
			PreparedStatement updateSQL = conn.prepareStatement(SQL);
			updateSQL.setInt(1, ID);
			updateSQL.setString(2, token);
			updateSQL.execute();
			conn.commit();
			
			return token;
			
		} catch (SQLException ex) {
			System.out.println("SQL Execption : " + ex.getMessage());
			System.out.println("SQLState : " + ex.getSQLState());
			System.out.println("VendorError : " + ex.getErrorCode());
			
			return "";
		} finally {
			if(stmt != null ) {
                            conn.close();
			}
		}
	}
	
	public boolean validateToken(String token) throws SQLException {
		int check = getIdToken(token);
		if(check == 0 || check == 9999 || check == -1) {
			return false;
		} else {
			return true;
		}
	}	

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Token</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Token at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
