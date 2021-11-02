/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group2.product;

import group2.category.CategoryDAO;
import group2.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author daong
 */
public class ProductDAO {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<ProductDTO> getAllProduct() throws Exception {

        List<ProductDTO> result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT productID,productName,image,description,categoryID,status,price,quantity FROM Products WHERE status = 'Active'";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ProductDTO product = new ProductDTO(productID, productName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }
    public List<ProductDTO> getAllProduct1() throws Exception {

        List<ProductDTO> result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT productID,productName,image,description,categoryID,status,price,quantity FROM Products WHERE status='Active' and quantity >0";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ProductDTO product = new ProductDTO(productID, productName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public List<ProductDTO> getProductByCateID(String cateID) throws Exception {

        List<ProductDTO> result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT productID,productName,image,description,categoryID,status,price,quantity FROM Products WHERE categoryID=? and status='Active' and quantity >0";

                ps = con.prepareStatement(sql);
                ps.setString(1, cateID);
                rs = ps.executeQuery();
                while (rs.next()) {

                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ProductDTO product = new ProductDTO(productID, productName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public ProductDTO getLastProduct() throws Exception {

        ProductDTO result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT TOP 1 productID,productName,image,description,categoryID,status,price,quantity FROM Products WHERE status = 'Active' ORDER BY CONVERT(int,productID) DESC";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    result = new ProductDTO(productID, productName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public ProductDTO getProductPrice1() throws Exception {

        ProductDTO result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT TOP 1 productID,productName,image,description,categoryID,status,price,quantity FROM Products WHERE categoryID='1' ORDER BY price DESC ";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    result = new ProductDTO(productID, productName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public ProductDTO getProductPrice2() throws Exception {

        ProductDTO result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT TOP 1 productID,productName,image,description,categoryID,status,price,quantity FROM Products WHERE categoryID='2' ORDER BY price DESC ";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    result = new ProductDTO(productID, productName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public ProductDTO getProductPrice3() throws Exception {

        ProductDTO result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT TOP 1 productID,productName,image,description,categoryID,status,price,quantity FROM Products WHERE categoryID='3' ORDER BY price DESC ";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    result = new ProductDTO(productID, productName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public List<ProductDTO> searchProduct(String name) throws Exception {
        List<ProductDTO> result = new ArrayList<>();
        String query = "select * from Products "
                + "where [productName] like ? and [status] like 'Active'";
        try {
            con = DBHelper.getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                String status = rs.getString("status");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                CategoryDAO categoryDAO = new CategoryDAO();
                ProductDTO product = new ProductDTO(productID, productName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                if (result == null) {
                    result = new ArrayList<>();
                }
                result.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;

    }

    public ProductDTO getProductByID(String id) throws Exception {

        ProductDTO result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT productID,productName,image,description,categoryID,status,price,quantity FROM Products WHERE productID=? ";

                ps = con.prepareStatement(sql);
                ps.setString(1, id);
                rs = ps.executeQuery();

                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    result = new ProductDTO(productID, productName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public ProductDTO getProductByID1(String id) throws Exception {

        ProductDTO result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT productID,productName,image,description,categoryID,status,price,quantity FROM Products WHERE productID=? ";

                ps = con.prepareStatement(sql);
                ps.setString(1, id);
                rs = ps.executeQuery();

                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    result = new ProductDTO(productID, productName, description, status, image, categoryID, price, quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public boolean checkProductID(String productID) throws Exception {
        boolean check = false;
        String sql = "select productName from Products where productID=?";
        try {
            con = DBHelper.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, productID);
            rs = ps.executeQuery();
            if (rs.next()) {
                check = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public boolean addNewProduct(ProductDTO product) throws Exception {

        boolean check = false;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "insert into Products(productID,productName,image,description,categoryID,status,price,quantity) values(?,?,?,?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, product.getProductID());
                ps.setString(2, product.getProductName());
                ps.setString(3, product.getImage());
                ps.setString(4, product.getDescription());
                ps.setString(5, product.getCategoryID());
                ps.setString(6, product.getStatus());
                ps.setFloat(7, product.getPrice());

                ps.setInt(8, product.getQuantity());

                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public boolean deleteProduct(String productID) throws Exception {
        boolean check = false;
        try {
            con = new DBHelper().getConnection();
            if (con != null) {
                String sql = "update Products set status=? where productID=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, "Inactive");
                ps.setString(2, productID);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public boolean updateProduct(ProductDTO product) throws Exception {
        boolean check = false;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "update Products set productName=?,image=?,description=?,categoryID=?,status=?,price=?,quantity=? where productID=? ";
                ps = con.prepareStatement(sql);

                ps.setString(1, product.getProductName());
                ps.setString(2, product.getImage());
                ps.setString(3, product.getDescription());
                ps.setString(4, product.getCategoryID());
                ps.setString(5, product.getStatus());
                ps.setFloat(6, product.getPrice());
                ps.setInt(7, product.getQuantity());
                ps.setString(8, product.getProductID());
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public int getQuantityByID(String productID) throws Exception {
        int quantity = 0;
        String sql = "select quantity from Products where productID=?";
        try {
            con = DBHelper.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, productID);
            rs = ps.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return quantity;
    }

    public boolean updateQuantity(String producID, int quantity) throws Exception {
        boolean check = false;
        try {
            con = new DBHelper().getConnection();
            if (con != null) {
                String sql = "update Products set quantity=? where productID=?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, quantity);
                ps.setString(2, producID);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public List<ProductDTO> pagingProduct(int index) throws Exception {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "SELECT * from products \n"
                + "WHERE status='Active' and quantity>0\n"
                + "ORDER BY productID\n"
                + "OFFSET ? rows FETCH next 9 rows only";
        try {
            con = new DBHelper().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1,(index - 1)*9);
            rs = ps.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                String status = rs.getString("status");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                CategoryDAO categoryDAO = new CategoryDAO();
                ProductDTO product = new ProductDTO(productID, productName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return list;
    }
    public List<ProductDTO> pagingProduct(int index,String cateID) throws Exception {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "SELECT * from products \n"
                + "WHERE status='Active' and quantity>0 and categoryID=?\n"
                + "ORDER BY productID\n"
                + "OFFSET ? rows FETCH next 9 rows only";
        try {
            con = new DBHelper().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cateID);
            ps.setInt(2,(index - 1)*9);
            rs = ps.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                String status = rs.getString("status");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                CategoryDAO categoryDAO = new CategoryDAO();
                ProductDTO product = new ProductDTO(productID, productName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return list;
    }

}
