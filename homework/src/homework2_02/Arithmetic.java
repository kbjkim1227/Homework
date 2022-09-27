package homework2_02;

import java.util.Scanner;

public class Arithmetic {

    public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);
	System.out.print("정수 x를 입력하세요 : "); int x = sc.nextInt();
	System.out.print("정수 y를 입력하세요 : "); int y = sc.nextInt();
		
	System.out.println("어떻게 계산하시겠습니까?");
	System.out.print("1)덧셈 2)빨셈 3)곱셈 4)나눗셈");
	int num = sc.nextInt();
		
	switch(num) {
	case 1: System.out.println("x + y = "+(x+y)); break;
	case 2: System.out.println("x - y = "+(x-y)); break;
	case 3: System.out.println("x * y = "+(x*y)); break;
	case 4: System.out.println("x / y = "+((double)x/y) + " 나머지는 "+(x%y)+"입니다." ); break; 
	}	
    }
}