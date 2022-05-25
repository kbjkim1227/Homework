package homework1_03;

import java.util.Scanner;

class SignRepeat {
   public static void main(String[] args) {
	  Scanner stdIn = new Scanner(System.in);
		 int retry;

		  do {
			  System.out.print("정수값:");
			  int n = stdIn.nextInt();
			
			  if (n > 0)
				  System.out.println("이 값은 양수입니다.");
			  else if (n < 0)
				  System.out.println("이 값은 음수입니다.");
			  else
				  System.out.println("이 값은 0입니다.");
			
			  System.out.print("다시 한번? 1-Yes / 0-No:");
			  retry = stdIn.nextInt();
       } while (retry==1);
    }
}
