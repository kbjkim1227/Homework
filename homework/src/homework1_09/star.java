package homework1_09;

import java.util.Scanner;

public class star {

	public static void main(String[] args) {
//		Scanner sc = new Scanner(System.in);
//		System.out.print("숫자를 입력하세요 : ");
//		int n = sc.nextInt();
		int n = 3;
		for(int i = 1; i <= n; i++) {
			printStar(n-i, 2*i-1);
		}
//		for(int i=n-1; i>=1; i--) {
//			printStar(n-i,2*i-1);
//		}
	}
	
	public static void printStar(int x, int n) {
		for(int i=0;i<x;i++) {
			System.out.print(" ");
		}
		
		for(int i=0;i<n;i++) {
			System.out.print("*");
		}
		System.out.println();
	}

}
