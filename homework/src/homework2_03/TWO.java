package homework2_03;

import java.util.Scanner;

//2. 지정값과 시프트 할 방향과 숫자를 입력하면 그 결과를 출력

public class TWO {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("지정값 : ");
		int x = scan.nextInt();
		System.out.print("방향을 입력하세요 1.left 2.right : " );
		int dir = scan.nextInt();
		
		System.out.print("얼만큼 시프트 할까요? ");
		int a = scan.nextInt();
		
		if(dir==1) x<<=a;
		else x>>=a;
		
		System.out.println("결과 :" + x);
		

	}

}
