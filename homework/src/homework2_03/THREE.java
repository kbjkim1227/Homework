package homework2_03;

/*전위 (++n)
연산자 ++가 피연산자 n보다 앞에 위치할 때를 전위라 하고 1증가된 값이 연산결과값이다.
후위 (n++)
반대로 연산자 ++가 피연산자 n보다 뒤에 위치할 때를 후위라 하고 1증가하기 전 값이 연산결과값이다.
*/
public class THREE {

	public static void main(String[] args) {
		 
		int a = 0;
		int b = 0;
		int cnt = 5;
		
		System.out.println("전위   |   후위");
	
		while(cnt-->=0) {
			System.out.printf("%2d%9d\n",++a,b++);
		}
	}
}
