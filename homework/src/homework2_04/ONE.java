package homework2_04;


import java.util.Scanner;
import java.util.ArrayList;

public class ONE {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        ArrayList<Integer> numbers = new ArrayList<>();
        String inputData;
        int max, storage = 0;

        while(true) {
            System.out.println("숫자 입력하시오: (그만 입력하고 싶으면 !를 입력하시오.)");
            inputData = scan.next();

            if(inputData.equals("!")) {
                break;
            }else {
                numbers.add(Integer.parseInt(inputData));
            }
        }

        for(int i=0; i<numbers.size(); i++) {
            max = numbers.get(i);

            for(int j=i+1; j<numbers.size(); j++) {
                if(numbers.get(j)>max) {
                    storage = j;
                    max = numbers.get(j);
                }               
            }

            numbers.set(storage, numbers.get(i));
            numbers.set(i, max);
        }

        System.out.println("\n내림차순 정리 결과는 다음과 같다.\n"+numbers);
        System.out.printf("제일 큰 값은 %d입니다.\n", numbers.get(0));
        System.out.printf("제일 작은 값은 %d입니다.\n", numbers.get(numbers.size()-1));

        int mid = numbers.size()/2;

        if(numbers.size()%2==1) {
            System.out.printf("중간 값은 %d입니다.\n", numbers.get(mid));
        }else {
            System.out.printf("중간 값은 %d or %d입니다.\n", numbers.get(mid-1), numbers.get(mid));
        }
    }
}