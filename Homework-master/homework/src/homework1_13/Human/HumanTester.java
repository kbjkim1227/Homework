package homework1_13.Human;

//사람 클래스(ver.1) 사용예
public class HumanTester {

	public static void main(String[] args) {
		Human gildong = new Human("길동", 170, 60);
		Human chulsu = new Human("철수", 166, 72);
		
		gildong.gainWeight(20);
		chulsu.reduceWeight(5);
		
		System.out.println("이름 :" + gildong.name);
		System.out.println("이름 :" + gildong.height + "cm");
		System.out.println("이름 :" + gildong.weight + "kg");
		System.out.println();
		
		System.out.println("이름 :" + chulsu.name);
		System.out.println("이름 :" + chulsu.height + "cm");
		System.out.println("이름 :" + chulsu.weight + "kg");
	}

}
