package table; // package table
import java.io.Serializable; // import Serialization for get and set, and storing form values into variables


public class User implements Serializable{ // declare class User that implements Serialization
	private static final long serialVersionUID = 1L; // Serial
	/* 
	declare String variables
	*/
	private String email;
	private String lname;
	private String fname;
	private String mname;
	private String username;
	private String password;
	private String bday;
	private String age;
	private String gender;
	private String phone;
	private String pa;
	private String ca;
	private String city;
	private String state;
	private String zip;
	private int type;
/* 
 public declaration of Class "User", with parameter , for inserting values
*/	
	public User(String email,String lname, String fname, String mname, String username, String password, String bday,String age, String gender, String phone, String pa, String ca, String city, String state, String zip, int type){
		this.email = email;
		this.lname = lname;
		this.fname = fname;
		this.mname = mname;
		this.lname = lname;
		this.username = username;
		this.password = password;
		this.bday = bday;
		this.age = age;
		this.gender = gender;
		this.pa = pa;
		this.ca = ca; 
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.type = type;
	}
	public User() {
		
	}
	/*
	set and get of variables
	e.g. getVar() setVar(String var)
	*/
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBday() {
		return bday;
	}

	public void setBday(String bday) {
		this.bday = bday;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPa() {
		return pa;
	}

	public void setPa(String pa) {
		this.pa = pa;
	}

	public String getCa() {
		return ca;
	}

	public void setCa(String ca) {
		this.ca = ca;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}

}
