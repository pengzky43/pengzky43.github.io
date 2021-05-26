package jcon; //package name

import java.sql.*; // importing sql for sql commands and jdbc

public class Connector{ // declaring class Connector at package name : connector
	static String CONNECTION_URL = "jdbc:mysql://localhost:3306/farmgoodph"; // set ConnectionUrl
	static String USERNAME = "root"; // set Username for sql default user: root
	static String PASSWORD = "Allsecured1131"; // set password for sql default: root
	static Connection con = null;

	public static Connection getConnection(){ // use Connection command in sql, adding additional syntax .getConnection later be called in sevlet
		try{ // for executing sql query safely and debugging if exception was found
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD); // create database connection at localhost:3306, 'root', 'justin'
		}
		catch(Exception e){ // catching Exception and sending it to variable 'e'
			e.printStackTrace(); // print trace error how the error was found or the command can't run
		}
		return con; // return values of con
	}
}