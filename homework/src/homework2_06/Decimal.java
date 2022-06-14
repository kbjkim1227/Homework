package homework2_06;

import java.util.Scanner;

public class Decimal {

    static boolean confirm(int num) {
	int cnt=0;
	for(int i=1;i<=num;i++) {
	    if(num%i==0) cnt++;
	}
		
	return (cnt==2) ? true:false;
    }
	
    public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);
	System.out.print("숫자를 입력하세요 : ");
	int x = sc.nextInt();
		
	for(int i=2;i<=x;i++) {
	    if(confirm(i)) {
		System.out.println(i+"는 소수입니다.");
	    }
	    else {
		System.out.println(i+"는 소수가 아닙니다.");
	    }
	}
    }
}