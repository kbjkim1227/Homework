package homework20220607;

public class One {

	public static void main(String[] args) {
		int num = 5;
		double num1 = 5.5;
		char kor = '가';
		char eng = 'a';
		System.out.println("int는"+num);
		System.out.println("double는"+num1);
		System.out.println("char한국어는"+kor);
		System.out.println("char영어는"+eng);
		
		num = eng;
		System.out.println(num);
		System.out.println("가의 유니코드는 " + (int)kor);
		
		
	
		double plus = num + num1;
				System.out.println(plus);
				
				boolean a1 = 1<2;
				boolean a2 = 1>2;
				boolean a3 = true;
				boolean a4 = false;
				  System.out.println(a1);
				  System.out.println(a2);
				  System.out.println(a3);
				  System.out.println(a4); 

	}

}
