package homework1_14.Human_03;


public class HumanTester1 {

	public static void main(String[] args) {
		
		Human gildong = new Human("길동", 170, 60, new Day(1975, 3, 12));
		Human chulsu = new Human("철수", 166, 72, new Day(1987, 10, 7));
		
		System.out.println("길동 =" + gildong);
		System.out.println("철수 =" + chulsu);
		

	}

}
