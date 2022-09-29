package homework;

import java.util.Scanner;

public class Factorial {

	public static void main(String[] args) {
		Scanner stdIn = new Scanner(System.in);
		int n;
		do {
			System.out.println("양의 정숫값:");
			n = stdIn.nextInt();
		}while (n <= 0);
		
		int kim = 1;
		int i = 1;
		
		while (i <= n) {
			kim *= i;
			i++;
		}
		System.out.println("1부터" +n+"까지의 곱은"+kim+"입니다.");


	}

}
