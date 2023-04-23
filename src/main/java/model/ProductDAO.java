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
	
	public void select(Product product) {
		String query = "SELECT * FROM products WHERE id = ?";
		try {
			Connection con = connect();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, product.getId());
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setPrice(rs.getFloat(3));
				product.setDescription(rs.getString(4));
				product.setImg(rs.getString(5));
				product.setQuantity(rs.getInt(6));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void update(Product product) {
		String query = "UPDATE products SET name = ?, price = ?, description = ?, img = ?, quantity = ? WHERE id = ?";
		try {
			Connection con = connect();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, product.getName());
			pst.setFloat(2, product.getPrice());
			pst.setString(3, product.getDescription());
			pst.setString(4, product.getImg());
			pst.setInt(5, product.getQuantity());
			pst.setInt(6, product.getId());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void delete(Product product) {
		String query = "DELETE FROM products WHERE id = ?";
		try {
			Connection con = connect();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, product.getId());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public ArrayList<Product> getProducts() {
		ArrayList<Product> products = new ArrayList<>();
		String query = "SELECT * FROM products";
		try {
			Connection con = connect();
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				float price = rs.getFloat(3);
				String description = rs.getString(4);
				String img = rs.getString(5);
				int quantity = rs.getInt(6);
				products.add(new Product(id,name,price,description,img,quantity));
			}
			con.close();
			return products;
		} catch (Exception e) {
			System.out.println(e);
			return null;
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