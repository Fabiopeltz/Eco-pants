package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// TODO: Auto-generated Javadoc
/**
 * The Class DAO.
 */
public class ProductDAO {

	/** The driver. */
	private String driver = "com.mysql.cj.jdbc.Driver";
	
	/** The url. */
	private String url = "jdbc:mysql://127.0.0.1:3306/ecopants?useTimezone=true&serverTimezone=UTC";
	
	/** The user. */
	private String user = "root";
	
	/** The password. */
	private String password = "";

	/**
	 * Conectar.
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
	
	public void insert(Product product) {
		String query = "INSERT INTO products (name, price, description, img, quantity) values (?,?,?,?,?)";
		try {
			Connection con = connect();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, product.getName());
			pst.setFloat(2, product.getPrice());
			pst.setString(3, product.getDescription());
			pst.setString(4, product.getImg());
			pst.setFloat(5, product.getQuantity());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void connectionTest() {
		try {
			Connection con = connect();
			System.out.println(con);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}