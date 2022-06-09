package homework2_03;

public class FIVE {
	public static void main(String[] args) {
		int a = 40, b = 30, c = 45;
		int max, min;
		max = (a > b && a > c) ? a : (b > c) ? b : c;
		min = (a < b && a < c) ? a : (b < c) ? b : c;
		System.out.println("최댓값 : " + max);
		System.out.println("최솟값 : " + min);
	}
}