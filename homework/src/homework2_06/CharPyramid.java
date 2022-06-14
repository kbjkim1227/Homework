package homework2_06;

import java.util.Scanner;

public class CharPyramid {

    static void printChar(int b,int c,int num) {
	int printfloor = 2*c + b;
	int cnt=0;
	char point = 'a';
	for(int i=1;i<=printfloor;i++) {
	    if(i>b) {
		if(i>num) {
		    cnt--;
		    System.out.print((char)(point+cnt));
		}
		else {
		    System.out.print((char)(point+cnt));
		    cnt++;
		}
	    }
	    else System.out.print(" ");
	}
	System.out.println();
    }
	
    public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);
	System.out.print("숫자를 입력하세요 : ");
	int x = sc.nextInt();
				
	System.out.println("Ver1.");
	System.out.println();
	for(int i=1;i<=x;i++) {
	    printChar(x-i,i,x);
	}
	for(int i=x;i>=1;i--) {
	    printChar(x-i,i,x);
	}
		
	System.out.println("--------------------------------");
	System.out.println("Ver2.");
	System.out.println();
	for(int i=x;i>=1;i--) {
	    printChar(x-i,i,x);
	}
	for(int i=1;i<=x;i++) {
	    printChar(x-i,i,x);
	}	
    }
}
