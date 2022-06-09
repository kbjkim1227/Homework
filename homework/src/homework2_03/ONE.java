package homework2_03;

import java.util.List;
import java.util.ArrayList;
import java.util.Scanner;

//1. 10진수 2진수로 변환하는 프로그램을 사용자 정의 함수로 생성
public class ONE {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("10진수를 입력하시오.");
		int x = scan.nextInt();
		System.out.println("2진수 변환");
		List<Integer> list = new ArrayList();
		
		while(x!=0) {
			list.add(x%2);
			x/=2;
		}
		for (int i =list.size()-1; i>=0; i--) {
			Integer a = list.get(i)	;		
			System.out.print(a);
		}
		System.out.printf("입니다."); 
	}

}
