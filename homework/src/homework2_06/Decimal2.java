package homework2_06;

import java.util.Scanner;

public class Decimal2 {

	   public static void main(String[] args) {
	      Scanner sc = new Scanner(System.in);
	      System.out.print("숫자입력 : ");
	      int x = sc.nextInt();
	      int cnt =0;
	      /*
	      while(y>1) {
	    	  if(x%y==0) cnt++;
	    	  y--;
	      }*/
	      
	      for(int i=1;i<=x;i++) {
	    	  if(x%i==0) cnt++;
	      }
	      
	      if(cnt>2) System.out.println("소수가 아닙니다.");
	      else System.out.println("소수입니다.");
	   }
	}