package model;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	/** The driver. */
	private String driver = "com.mysql.cj.jdbc.Driver";
	
	/** The url. */
	private String url = "jdbc:mysql://127.0.0.1:3306/ecopants?useTimezone=true&serverTimezone=UTC";
	
	/** The user. */
	private String user = "root";
	
	/** The password. */
	private String password = "";

	/**
	 * Connect.
	 *
	 * @return the connection
	 */
	private Connection connect() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public boolean insert(User user) {
		if(!isUserRegistered(user.getEmail())) {
			String query = "INSERT INTO users (name,lastname,email,password) VALUES (?,?,?,?)";
			try (Connection con = connect();
		             PreparedStatement pst = con.prepareStatement(query)) {
				pst.setString(1, user.getName());
				pst.setString(2, user.getLastname());
				pst.setString(3, user.getEmail());
				pst.setString(4, encryptPassword(user.getPassword()));
				pst.executeUpdate();
				con.close();
				return true;
			} catch (Exception e) {
				System.out.println(e);
				return false;
			}
		}
		return false;
	}
	
	public boolean authenticate(User user) {
        String encryptedPassword = encryptPassword(user.getPassword());
        String query = "SELECT COUNT(*) FROM users WHERE email = ? AND password = ?";
        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, user.getEmail());
            ps.setString(2, encryptedPassword);
            try (ResultSet rs = ps.executeQuery()) {
            	rs.next();
                return rs.getInt(1) > 0;
            }
        } catch(Exception e) {
        	System.out.println(e);
        	return false;
        }
    }
	
	public boolean isUserRegistered(String email) {
        String query = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                rs.next();
                return rs.getInt(1) > 0;
            }
        } catch(Exception e) {
        	System.out.println(e);
        	return false;
        }
	}
	
	private String encryptPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedPassword = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedPassword) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            throw new RuntimeException("Error encrypting password", e);
        }
    }
}
