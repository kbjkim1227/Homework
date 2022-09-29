
class Human {

String name;
int height;
int weight; 
}
class HumanTester {
public static void main(String[] args) {
Human gildong = new Human();
Human chulsu = new Human();

gildong.name = "길동";
gildong.height = 170;
gildong.weight = 60;

chulsu.name = "철수";
chulsu.height = 166;
chulsu.weight = 72;

System.out.println("O:"+ gildong.name);
System.out.println(":" + gildong.height + "cm");
System.out.println(":" + gildong.weight + "kg");
System.out.println();

System.out.println("O:" + chulsu.name);
System.out.println(":"+chulsu.height
+ "cm");
System.out.println(":" + chulsu.weight + "kg");
}
}	        		