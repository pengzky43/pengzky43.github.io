package crypt;
import java.util.*;
import org.mindrot.jbcrypt.*;
public class PassCrypt {

	public static String hash(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt(12));
	}
	public static Boolean verifyHash(String password, String Hash) {
		return BCrypt.checkpw(password, Hash);
	}
	// ##############################################################
	/* public static void main(String[] args) {						#
		// TODO Auto-generated method stub 							#
		String pass = "Allsecured1131";								#
		String hashed = hash(pass);									#
		System.out.println(hashed);									#
		Scanner inputPass = new Scanner(System.in);					#
		System.out.print("Enter Password: ");						#
		String Password = inputPass.nextLine();						#
		if(verifyHash(Password, hashed)) {							#
			System.out.println("Password Matched.");				#
		}															#
		else System.out.println("Password is not Matched.");		#
		inputPass.close();											#
																	#
																	#
	} */												//			#
	// ##############################################################
}
