package homework2_02;

import java.util.Scanner;

public class Test04 {

   public static void main(String[] args) {
      System.out.print("첫번째 수를 입력해 주세요 : ");
      Scanner scan = new Scanner(System.in);
      int a1 = scan.nextInt();

      System.out.print("가감승제 연산자 중 하나를 입력해 주세요 : ");
      String b1 = scan.next();

      System.out.print("두번째 수를 입력해 주세요 : ");
      int a2 = scan.nextInt();

      double result = 0;
      switch (b1) {
      case "+":
         result = (a1 + a2);
         break;
      case "-":
         result = (a1 - a2);
         break;
      case "*":
         result = (a1 * a2);
         break;
      case "/":
         result = (double) a1 / a2;
         break;
      }

      System.out.println(a1 + b1 + a2 + "=" + result);
   }
}
