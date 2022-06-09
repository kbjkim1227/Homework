package homework2_03;

import java.util.Scanner;



public class FIVE02 {
    public static void main(String[] args) {
        
        int num1,num2,num3;//숫자 3개 입력받을 변수 선언
        int big,middle,small;//숫자 두개의 비교 값을 저장할 변수 선언
        
        Scanner input = new Scanner(System.in);
        System.out.print("숫자 입력 : ");
        num1 = input.nextInt();//숫자 1 입력
        System.out.print("숫자 입력 : ");
        num2 = input.nextInt();//숫자 2 입력
        System.out.print("숫자 입력 : ");
        num3 = input.nextInt();//숫자 3 입력
        
        big = (num1>num2)&&(num1>num3)?num1:(num3>num2?num3:num2);
        //num1이 num2보다 큰지 비교,num1이 num3보다 큰지 비교 둘 다 참이면 num1이 가장크다. 
        small = (num2>num1)&&(num3>num1)?num1:(num2>num3?num3:num2);
        //num2이 num1보다 큰지 비교,num3이 num1보다 큰지 비교해서 num1이 제일 작으면 저장 아니면 뒤의 수식 수행
        System.out.println("최대값 :"+big);//결과를 출력한다.2
              System.out.println("최소값 :"+small);        
    }
}
