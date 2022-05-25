// 2차원 좌표 클래스 Coordinate(Ver.1) 사용 예(방법3: 배열)
import java.util.Scanner;
class CoordinateTester3 {
public static void main(String[] args) {
Scanner stdIn = new Scanner(System.in);
System.out.print(":");
int n = stdIn.nextInt();
Coordinate[] a = new Coordinate[n]; // nol Coordinate
for (int i = 0; i < a.length; i++)
a[i]= new Coordinate (5.5, 7.7);
// 모든 요소를 (5.5, 7.7)로 생성
for (int i=0; i < a.length; i++)
System.out.printf("a[%d] = (%.1f, %.1f)\n", i, a[i].getX(), a[i].getY());
}
}			        		