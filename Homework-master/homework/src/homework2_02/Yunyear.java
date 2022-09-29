package homework2_02;

import java.util.Scanner;

//1. int year=2004 처럼 년도를 설정하면 홀수/짝수해 인지를 구분하고 윤년까지 출력 구별해서 출력

public class Yunyear {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int num;
        do {
        	System.out.printf("년도를 입력해주세요 : ");
        	int a = scan.nextInt();
        
        	if(a % 4 == 0 && a % 100 != 0 || a % 400 == 0) {
        		System.out.println("짝수년도\n윤년입니다.");
        	} else  {
        		System.out.println("홀수년도\n윤년이 아닙니다.");
        	}
        	System.out.println();
        	System.out.println("프로그램을 종료하시겠습니까? 1.예 2.아니오");
        	num = scan.nextInt();
        	
        }while(num ==1);	
        System.out.println("프로그램종료");
    }
}
 