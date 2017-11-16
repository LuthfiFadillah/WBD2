/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ojekservice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Iftitakhul Zakiyah
 */
@WebService(serviceName = "HistoryService")
public class HistoryService {
    private int user_id;
    private int driver_id;
    private long date;
    private String nama;
    private String destination;
    private int rating;
    private String comments;
    private boolean isDriver;
    private String picking_location;
    
  
//    public HistoryService() {
//        nama = "dummy";
//        location = "bandung timur";
//    }
    
    public ArrayList<HistoryService> getHistoryDriver(int id)  throws SQLException {
        Statement stmt = null;
        String URL = "jdbc:msql://sql12.freemysqlhosting.net:3306/sql12203267";
	String user = "sql12203267";
	String pass = "7hzG8BMyYV";
        String SQL = "SELECT * FROM order_ojek NATURAL JOIN rating WHERE driver_id=?";
        
	Connection conn = DriverManager.getConnection(URL);
        PreparedStatement updateSQL = null;
        updateSQL = conn.prepareStatement(SQL);
        updateSQL.setInt(1,id);
        updateSQL.executeUpdate();
        
        ResultSet rs = stmt.executeQuery(SQL);
        
        ArrayList<HistoryService> list = new ArrayList<HistoryService>();
        
        while(rs.next()) {
            if(rs.getInt("driver_id") == id) {
                list.add(this);
            }
        }
        return list;
    }
    
     public ArrayList<HistoryService> getHistoryOrder(int id)  throws SQLException {
         Statement stmt = null;
        String URL = "jdbc:msql://sql12.freemysqlhosting.net:3306/sql12203267";
	String user = "sql12203267";
	String pass = "7hzG8BMyYV";
        String SQL = "SELECT * FROM order_ojek NATURAL JOIN rating WHERE driver_id=?";
        
	Connection conn = DriverManager.getConnection(URL);
        PreparedStatement updateSQL = null;
        updateSQL = conn.prepareStatement(SQL);
        updateSQL.setInt(1,id);
        updateSQL.executeUpdate();
        
        ResultSet rs = stmt.executeQuery(SQL);
        
        ArrayList<HistoryService> list = new ArrayList<HistoryService>();
        
        while(rs.next()) {
            if(rs.getInt("user_id") == id) {
                list.add(this);
            }
        }
        return list;
     }
     
//     public boolean isValidToken(String token){
//         return true;
//     }
    public int getUserID() {
        return user_id;
    }
    
    public void setUserID(int uID) {
        user_id = uID;
    }
    
    public int getDriverID() {
        return driver_id;
    }
    
    public void setDriverID(int dID) {
        driver_id = dID;
    }
    
    public long getDate () {
        return date;
    }
    
    public void setDate(long date) {
        this.date = date;
    }
    
    public String getNama() {
        return nama;
    }
    
    public void setNama(String name) {
        nama = name;
    }
    
    public String getPLocation(){
        return picking_location;
    }
    
    public void setPLocation (String loc) {
        picking_location = loc;
    }
    
    public int getRating () {
        return rating;
    }
    
    public void setRating(int rate) {
        rating = rate;
    }
    
    public String getComment () {
        return comments;
    }
    
    public void setComment (String comments) {
        this.comments = comments;
    }
    
    public boolean getDriver() {
        return isDriver;
    }
    
    public void setDriver(boolean driver) {
        isDriver = driver;
    }
    /**
     * This is a sample web service operation
     */
//    @WebMethod(operationName = "hello")
//    public String hello(@WebParam(name = "name") String txt) {
//        return "Hello " + txt + " !";
//    }
}
