package homework2_04;

public class jinsu {
	
	static final int JinNum= 2; //기호상수 

	public static void main(String[] args) {
		
		int num=8;
		int cnt=0;
		int[] bin = new int[15];
		
		while(num >=1) { 
			
			bin[cnt] = num% JinNum;
			cnt++;
			num = num/JinNum;
			
		}
		for (int i = cnt-1; i >= 0; i--) {
			System.out.print(bin[i]);
			
		}

	}

}
