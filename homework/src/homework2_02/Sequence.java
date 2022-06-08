package homework2_02;


public class Sequence {

    public static void main(String[] args) {
	for(int i=1;i<=2;i++) {
	    System.out.print(i+" : ");
	    if(i==1) {
		for(int j=0;j<5;j++) { 
		    System.out.print(1*(int)Math.pow(2,j)+" ");
		}
	    }
	    else {
		for(int j=0;j<5;j++)
		    System.out.print(250-(50*j)+" ");
		}
			
	    System.out.println();
	}
    }
}