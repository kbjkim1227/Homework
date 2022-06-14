package homework2_06;

public class Dice {
	
    public static void AddDice() {
	for(int i=1;i<=6;i++) {
	    for(int j=1;j<=6;j++) {
		System.out.print(i+" + "+j+" = "+(i+j)+"\t");
	    }
	    System.out.println();
    	}
	System.out.println("-------------------------------------------------------------------------------------------");
    }
	
    public static void MultiDice() {
	for(int i=1;i<=6;i++) {
	    for(int j=1;j<=6;j++) {
		System.out.print(i+" * "+j+" = "+(i*j)+"\t");
	    }
	    System.out.println();
	}
	System.out.println("-------------------------------------------------------------------------------------------");
    }
	
    public void AddnDice() {
	for(int i=1;i<=6;i++) {
	    for(int j=1;j<=6;j++) {
		System.out.print(i+" + "+j+" = "+(i+j)+"\t");
	    }
	    System.out.println();
	}
	System.out.println("--------------------------------------------------------------------------------------------");
    }
	
    public void MultinDice() {
	for(int i=1;i<=6;i++) {
	    for(int j=1;j<=6;j++) {
		System.out.print(i+" * "+j+" = "+(i*j)+"\t");
	    }
	    System.out.println();
	}
	System.out.println("--------------------------------------------------------------------------------------------");
    }
}





