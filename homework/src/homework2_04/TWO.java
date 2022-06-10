package homework2_04;

import java.util.Scanner;

public class TWO {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("문자를 입력하세요 : ");
		String a = sc.next();
		for (int i = 0; i < a.length(); i++) {
			
			System.out.printf("0x%04x",(int)a.charAt(i));
			
			
		}
	}

}
