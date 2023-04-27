package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
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

    public boolean insert(Cart item) {
        try {
        	Connection conn = connect();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO cart(user_id, product_id, quantity) VALUES (?, ?, ?)");
            ps.setInt(1, item.getUserId());
            ps.setInt(2, item.getProductId());
            ps.setInt(3, 1);
            int rowsInserted = ps.executeUpdate();
            conn.close();
            return rowsInserted > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public ArrayList<Cart> getCartItemsByUser(int userId) {
        try {
            Connection conn = connect();
            ArrayList<Cart> cartItems = new ArrayList<>();
            PreparedStatement ps = conn.prepareStatement("SELECT c.quantity, p.* FROM cart c INNER JOIN products p ON c.product_id = p.id WHERE c.user_id = ?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int quantity = rs.getInt("quantity");
                int id = rs.getInt("id");
                String name = rs.getString("name");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                String img = rs.getString("img");
                int productQuantity = rs.getInt("quantity");
                Product product = new Product(id, name, price, description, img, productQuantity);
                Cart cart = new Cart(userId, product, quantity);
                cartItems.add(cart);
            }
            conn.close();
            return cartItems;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public Cart getCartItem(int userId, int productId) {
        try {
            Connection conn = connect();
            PreparedStatement ps = conn.prepareStatement("SELECT c.quantity, p.* FROM cart c INNER JOIN products p ON c.product_id = p.id WHERE c.user_id = ? AND c.product_id = ?");
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int quantity = rs.getInt("quantity");
                int id = rs.getInt("id");
                String name = rs.getString("name");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                String img = rs.getString("img");
                int productQuantity = rs.getInt("quantity");
                Product product = new Product(id, name, price, description, img, productQuantity);
                conn.close();
                return new Cart(userId, product, quantity);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public boolean isCartItemExist(int userId, int productId) {
        try {
        	Connection conn = connect();
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) as count FROM cart WHERE user_id = ? AND product_id = ?");
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int count = rs.getInt("count");
            conn.close();
            return count > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean increaseCartItemQuantity(int userId, int productId) {
        try {
        	Connection conn = connect();
            PreparedStatement ps = conn.prepareStatement("UPDATE cart SET quantity = quantity + 1 WHERE user_id = ? AND product_id = ?");
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            int rowsUpdated = ps.executeUpdate();
            conn.close();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean decreaseCartItemQuantity(int userId, int productId) {
        try {
        	Connection conn = connect();
            PreparedStatement ps = conn.prepareStatement("UPDATE cart SET quantity = quantity - 1 WHERE user_id = ? AND product_id = ?");
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                PreparedStatement ps2 = conn.prepareStatement("SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?");
                ps2.setInt(1, userId);
                ps2.setInt(2, productId);
                ResultSet rs = ps2.executeQuery();
                rs.next();
                int quantity = rs.getInt("quantity");
                if (quantity == 0) {
                    return deleteCartItem(userId, productId);
                }
            }
            conn.close();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean deleteCartItem(int userId, int productId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;

        try {
        	conn = connect();
            String query = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                success = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }

}