package homework1_04;

import java.util.Scanner;

class CountDownFor {
    public static void main(String[] args) {
        Scanner stdIn = new Scanner(System.in);
        System.out.println("카운트다운 합니다.");
        int x = 1;
        do {
            System.out.print("양의 정숫값:");
            x = stdIn.nextInt();
       } while (x <= 0);
		
        for (; x>=0 ; x--)
            System.out.println(x);    // x값을 표시
    }
}
