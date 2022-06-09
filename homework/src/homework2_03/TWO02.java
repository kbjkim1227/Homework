package homework2_03;

import java.util.Scanner;

//지정값과 시프트 할 방향과 숫자를 입력하면 그 결과를 출력
public class TWO02 {
public static void main(String[] args) {
   Scanner input = new Scanner(System.in);
   
   System.out.println("지정값을 입력하세요.");
   int num1 = input.nextInt();
   System.out.println("시프트 할 방향을 입력하세요. 1. 왼쪽 2. 오른쪽");
   int num2 = input.nextInt();
   System.out.println("몇 번 이동하시겠습니까?");
   int num3 = input.nextInt();
   int result = 0;
   
   switch(num2) {
   
   case 1 : 
      result = num1 << num3;
      System.out.println("결과는 " + result + " 입니다.");
      break;
      
   case 2 : 
      result = num1 >> num3;
      System.out.println("결과는 " + result + " 입니다.");
      break;
      }
   }
}
