package homework2_01;

public class Three {

	public static void main(String[] args) {
		byte a = Byte.MIN_VALUE;
		byte b = Byte.MAX_VALUE;
		System.out.println("정수의 데이터범위는 " +a+" ~ "+b+" 이다");
		
		char c = Character.MIN_VALUE;
		char d = Character.MAX_VALUE;
		int aa = (int)c;
		int bb = (int)d;
				
		System.out.println("문자의 데이터범위는 " +aa+" ~ "+bb+" 이다");

	}

}
