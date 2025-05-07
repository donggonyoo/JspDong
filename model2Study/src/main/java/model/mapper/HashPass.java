package model.mapper;

import org.mindrot.jbcrypt.BCrypt;

public class HashPass {
	public static void main(String[] args) {
		String pass = "1233";
		String hashpw = BCrypt.hashpw(pass, BCrypt.gensalt());
		System.out.println(pass+":"+hashpw);
		System.out.println( BCrypt.checkpw(pass, hashpw));
		System.out.println("zzz");
	}

}
