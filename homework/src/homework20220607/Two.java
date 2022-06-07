package homework20220607;

public class Two {

	public static void main(String[] args) {
		
		System.out.println("int를 byte로 형변환");
		int a = 128;
		byte b = (byte)a;
		System.out.println("int : "+a);
		System.out.println("byte : "+b);
		System.out.println();
		
		System.out.println("double을 short로 형변환");
		double c = 100.8;
		short d = (short)c;
		System.out.println("double : "+c);
		System.out.println("short : "+d);
		System.out.println();
		
		System.out.println("char을 int로 형변환");
		char e = 'A';
		int f = (int)e;
		System.out.println("char : " + e);
		System.out.println("int : " + f);
        System.out.println();
		
		System.out.println("int를 char로 형변환");
		int g = 66;
		char h = (char)g;
		System.out.println("int : " + g);
		System.out.println("char : " + h);
	
	}

}
