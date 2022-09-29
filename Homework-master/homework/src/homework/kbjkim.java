package homework;

import java.util.Scanner;

public class kbjkim {
	   /*
	    * # 최대값 구하기[2단계]
	    * 1. 반복횟수를 입력받는다. 
	    * 2. 입력받은 반복횟수만큼 숫자를 입력받고 
	    * 3. 입력받은 숫자 중 가장 큰 값을 출력한다.
	    */
	   public static void main(String[] args) {
	      Scanner sc = new Scanner(System.in);
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