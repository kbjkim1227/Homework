package homework1_20;

public class PrintAscii {
	
	public static void main(String[] ages) {
		for (char i = 0x21; i < 0x7E; i++)
			System.out.printf("%c%04x\n", i, (int)i);
		
		
	}

}
