package homework2_01;

import java.util.Scanner;

public class Four_chap2 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		do {
		System.out.println("문자를 입력하세요.");
		
		String a = scan.next();
		for (int i = 0; i < a.length(); i++) {
	    	
	    	System.out.println(((int)a.charAt(i)));
	    	
		}
		
		}while(true);	
	}

}
