package P1004;


import java.io.FileReader;
import java.io.Reader;

public class ReadExample2 {

		public static void main(String[] args) throws Exception {
		
			Reader reader = new FileReader("c:/temp/test1.txt");

		int readDataNo;
		char[] cbuf = new char[4];
		readDataNo=reader.read(cbuf,1,2);
		for (int i = 0; i < cbuf.length; i++) {
			System.out.print(cbuf[i]);
			
		}
		reader.close();

	
	}
}