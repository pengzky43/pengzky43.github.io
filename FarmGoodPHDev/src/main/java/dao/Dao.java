package dao; // package name

import table.Items;
import table.User; // importing table.User that use java.io.Serialization;
import java.util.*;

import crypt.PassCrypt;

import java.sql.*;
import jcon.Connector;


public class Dao { // class Dao
	public static long insert(User user) { //long insert to user(customized) in Class User from package table
		return 0; // needed for reducing logic error
		}
	private static User data = new User();
	private static Items itemdata = new Items();
	private static ResultSet rs = null;
	public static List<User> signUp(String username, String password, String email){
		List<User> user = new ArrayList<User>();
		Connection con = Connector.getConnection();
		try{
			String q = "insert into farmuser (username, password, email)" + " values (?, ?, ?)";
			PreparedStatement stmt = con.prepareStatement(q);
			stmt.setString(1, username);
			stmt.setString(2, PassCrypt.hash(password));
			stmt.setString(3, email);
			stmt.execute();
			con.close();
		}catch(Exception e){e.printStackTrace();}
		return user;
	}
	public static List<User> getData(String username, String password){
		List<User> list = new ArrayList<User>();
		try {
			Connection con = Connector.getConnection();
			String q = "select * from farmuser where username=?";
			PreparedStatement stmt = con.prepareStatement(q);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			int ID = 0;
			while(rs.next()) {
				ID = rs.getInt("UserID");
				data.setUsername(rs.getString("username"));
				data.setPassword(rs.getString("password"));
				data.setEmail(rs.getString("email"));
				data.setFname(rs.getString("fname"));
				data.setMname(rs.getString("mname"));
				data.setLname(rs.getString("lname"));
				data.setAge(rs.getString("age"));
				data.setGender(rs.getString("gender"));
				data.setPhone(rs.getString("phone"));
				data.setPa(rs.getString("pa"));
				data.setCa(rs.getString("ca"));
				data.setCity(rs.getString("city"));
				data.setState(rs.getString("state"));
				data.setZip(rs.getString("zip"));
				data.setType(rs.getInt("type"));
				}
				if(PassCrypt.verifyHash(password, data.getPassword())){
					list.add(data);
				}
				else{
					list.clear();
				}
			con.close();
			}
		catch(Exception e) {e.printStackTrace();}
		return list;
	}
	/*public static void main(String args[]) {
		List<User> list = getData("pengzky43", "Allsecured1131");
		
	} */
	public static List<Items> getItems(int ID){
		List<Items> list = new ArrayList<Items>();
		try {
			Connection con = Connector.getConnection();
			String q = "select * from sellersitems where SellID=?";
			PreparedStatement stmt = con.prepareStatement(q);
			stmt.setInt(1, ID);
			rs = stmt.executeQuery();
			int id = 0;
			while(rs.next()) {
				id = rs.getInt("ID");
				itemdata.setItemName(rs.getString("ItemName"));
				itemdata.setDesc(rs.getString("ItemDesc"));
				itemdata.setPrice(rs.getString("ItemPrice"));
				itemdata.setQty(rs.getInt("ItemQty"));
				itemdata.setSellID(rs.getInt("SellID"));
				itemdata.setSellName(rs.getString("SellerName"));
				itemdata.setImage(rs.getBlob("Image"));
				itemdata.setImageType(rs.getInt("ImageType"));
				list.add(itemdata);
				}
			con.close();
			}
		catch(Exception e) {
			e.printStackTrace();
			}
		return list;
	}
	public static List<Items> searchCat(String tags){
		List<Items> list = new ArrayList<Items>();
		List<String> list_tag = new ArrayList<String>();
		Connection con = Connector.getConnection();
		try{
			String q = "select * from sellersitems where category like ?";
			for(String s: tags.split("#")){list_tag.add(s);}
			for(int c = 0;c<list_tag.size()-1;c++){
				q = q + " or like ?";
			}
			int c = 1;
			Iterator<String> tag_iterator = list_tag.iterator();
			PreparedStatement stmt = con.prepareStatement(q);
			stmt.setString(1, list_tag.get(0));
			while(tag_iterator.hasNext()) {
				stmt.setString(c, "%" + tag_iterator.next() + "%");
				c++;
			}
			rs = stmt.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("ID");
				itemdata.setItemName(rs.getString("ItemName"));
				itemdata.setDesc(rs.getString("ItemDesc"));
				itemdata.setPrice(rs.getString("ItemPrice"));
				itemdata.setQty(rs.getInt("ItemQty"));
				itemdata.setSellID(rs.getInt("SellID"));
				itemdata.setSellName(rs.getString("SellerName"));
				itemdata.setImage(rs.getBlob("Image"));
				itemdata.setImageType(rs.getInt("ImageType"));
				list.add(itemdata);
			}
			con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}
	public static List<Items> search(String query){
		List<Items> list = new ArrayList<Items>();
		Connection con = Connector.getConnection();
		query = "%" + query + "%";
		try{
			String q = "select * from sellersitems where ItemName like ?";
			PreparedStatement stmt = con.prepareStatement(q);
			stmt.setString(1, query);
			rs = stmt.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("ID");
				itemdata.setItemName(rs.getString("ItemName"));
				itemdata.setDesc(rs.getString("ItemDesc"));
				itemdata.setPrice(rs.getString("ItemPrice"));
				itemdata.setQty(rs.getInt("ItemQty"));
				itemdata.setSellID(rs.getInt("SellID"));
				itemdata.setSellName(rs.getString("SellerName"));
				itemdata.setImage(rs.getBlob("Image"));
				itemdata.setImageType(rs.getInt("ImageType"));
				list.add(itemdata);
			}
			con.close();
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	public static List<Items> getItems(){
		List<Items> list = new ArrayList<Items>();
		try {
			Connection con = Connector.getConnection();
			String q = "select * from sellersitems";
			PreparedStatement stmt = con.prepareStatement(q);
			rs = stmt.executeQuery();
			int id = 0;
			while(rs.next()) {
				id = rs.getInt("ID");
				itemdata.setItemName(rs.getString("ItemName"));
				itemdata.setDesc(rs.getString("ItemDesc"));
				itemdata.setPrice(rs.getString("ItemPrice"));
				itemdata.setQty(rs.getInt("ItemQty"));
				itemdata.setSellID(rs.getInt("SellID"));
				itemdata.setSellName(rs.getString("SellerName"));
				itemdata.setImage(rs.getBlob("Image"));
				itemdata.setImageType(rs.getInt("ImageType"));
				list.add(itemdata);
				}
			con.close();
			}
		catch(Exception e) {
			e.printStackTrace();
			}
		return list;
	}
	
}
