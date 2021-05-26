package table; // package table
import java.io.Serializable; // import Serialization for get and set, and storing form values into variables
import java.sql.Blob;


public class Items implements Serializable{ // declare class User that implements Serialization
	private static final long serialVersionUID = 1L; // Serial
	/* 
	declare String variables
	*/
	String itemname;
	String desc;
	String price;
	int qty;
	int sellID;
	String sellName;
	Blob image;
	int imageType;
	
/* 
 public declaration of Class "User", with parameter , for inserting values
*/	public  Items() {
	
}
	public Items(String itemname, String desc, String price, int qty, int sellID, String sellName, Blob image, int imagType){
		
	}
	/*
	set and get of variables
	e.g. getVar() setVar(String var)
	*/
	public String getItemName() {
		return itemname;
	}

	public void setItemName(String itemname) {
		this.itemname = itemname;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getSellID() {
		return sellID;
	}
	public void setSellID(int sellID) {
		this.sellID = sellID;
	}
	public String getSellName() {
		return sellName;
	}
	public void setSellName(String sellName) {
		this.sellName = sellName;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	public int getImagetype() {
		return imageType;
	}
	public void setImageType(int imageType) {
		this.imageType = imageType;
	}
	

}
