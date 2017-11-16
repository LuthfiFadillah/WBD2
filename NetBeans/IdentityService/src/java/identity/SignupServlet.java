package identity;

import com.google.gson.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
                // Declaring Variables from signup form
                String json = request.getParameter("json");
                String name;
		String uname;
                String email;
		String pass;
                String conf_pass;
                String phone;
                Boolean isDriver;
                
                //get value from signup form
                JsonElement element = new JsonParser().parse(json);
                JsonObject object = element.getAsJsonObject();
                name = object.get("name").toString();
		uname = object.get("uname").toString();
                email = object.get("email").toString();
		pass = object.get("pass").toString();
                conf_pass = object.get("conf_pass").toString();
                phone = object.get("phone").toString();
                isDriver = object.get("isDriver").getAsBoolean();
                
                //check password = confirmpass
                if(pass.equals(conf_pass)){                    
                    response.sendRedirect("http://localhost:8085/WebApp/pages/Signup.jsp");
                    return;
                }
                
		// Connect to Database
		Connection conn = null;
    		String URL = "jdbc:msql://sql12.freemysqlhosting.net:3306/sql12203261";
		String user = "sql12203261";
		String password = "Hq5tyJRtPn";
		Properties connectionProps = new Properties();
                connectionProps.put("user", user);
                connectionProps.put("password", password);
	    try {
                conn = DriverManager.getConnection(URL, connectionProps);
            } catch (SQLException ex) {
                Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
	    
	    // Processing Query
	    Statement stmt = null;
	    String query = "SELECT 'ID','username' FROM 'identity-signup'";
	    try {
                stmt = conn.createStatement();
		ResultSet res = stmt.executeQuery(query);
                int id = 0;
                int isd = 0;
                boolean found = false;
                
                //check if any username in DB is same as username from input
                while(res.next() && !found){
                    id = res.getInt("ID");
                    if (res.getString("username").equals(name)){
                        response.sendRedirect("http://localhost:8085/WebApp/pages/Signup.jsp");
                        found = true;
                    }
                }
                
                //if not found
                if(!found){
                    if(isDriver){
                        isd = 1;
                    }
                    else{
                        isd = 0;
                    }
                    //insert input data into signup DB
                    query = "INSERT INTO 'identity-signup' ('ID','name','username','email','password','phonenumber','isdriver')" +
                            "VALUES ('"+id+"','"+name+"','"+uname+"','"+email+"','"+pass+"','"+phone+"','"+isd+"')";
                    stmt = conn.createStatement();
                    res = stmt.executeQuery(query);
                    //get token
                    request.getSession().setAttribute("username", uname);
                    if(isDriver){
                        response.sendRedirect("http://localhost:8085/WebApp/pages/OrderOjek.jsp");
                    }
                    else{
                        response.sendRedirect("http://localhost:8085/WebApp/pages/Profile.jsp");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                    try {
                        conn.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
            }
	}
}
