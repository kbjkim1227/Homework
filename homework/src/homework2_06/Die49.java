package homework2_06;

public class Die49 {

	public static void main(String[] args) {
		// 주사위 두 개로 만든 숫자의 합과 곱을 구구단처럼 출력
		      Die.printAddDie();
		      Die.printMultiDie();
		      
		      // non-static
		      Die die = new Die();
		      die.printnAddDie();
		      die.printnMultiDie();

		   }

		}

		class Die
		{ 
		   public static void printAddDie() {
		      for(int i=1; i<=6; i++) {
		         for(int j=1; j<=6; j++) {
		            System.out.println(j + "+" + i + "=" + (i+j) + "\t" );
		         }
		         System.out.println();
		      }
		      System.out.println("-------------------------");
		   }
		   public void printnAddDie() {
		      for(int i=1; i<=6; i++) {
		         for(int j=1; i<=6; i++) {
		            System.out.println(j + "+" + i + "=" + (i+j) + "\t");
		         }
		         System.out.println();
		      }
		      System.out.println("-------------------------");
		   }
		   public static void printMultiDie() {
		      for(int i=1; i<=6; i++) {
		         for(int j=1; j<=6; j++) {
		            System.out.println(j + "*" + i + "=" + (i*j) + "\t" );
		            
		         }
		         System.out.println();
		      }
		      System.out.println("-------------------------");
		   }
		   public void printnMultiDie() {
		      for(int i=1; i<=6; i++) {
		         for(int j=1; j<=6; j++) {
		            System.out.println(j + "*" + i + "=" + (i*j) + "\t" );
		         }
		         System.out.println();
		      }
		      System.out.println("------------------------");
		   }
		}