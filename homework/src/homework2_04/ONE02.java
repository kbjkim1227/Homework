package homework2_04;


public class ONE02 {
    int size;
    // constructor
    public ONE02(int[] sampleData) {
        size = sampleData.length;
        recusiveSorting(sampleData);
        printResult(sampleData);
    }

    // sorting
    public int[] recusiveSorting(int[] sampleData) {
        for(int i=0; i<size; i++)
            for(int j=i; j<size; j++)
                if(sampleData[i]>sampleData[j])
                    swapData(i, j, sampleData);
        return sampleData;
    }
    private void swapData(int i, int j, int[] sampleData) {
        int temp = sampleData[i];
        sampleData[j] = sampleData[i];
        sampleData[i] = temp;
    }

    // print result
    public void printResult(int[] sampleData) {
         System.out.println("최대값: "+sampleData[size-1]);
         System.out.println("최소값: "+sampleData[0]);

         if(size%2==0)
             System.out.println("중간값: "+sampleData[size/2-1]+ ", "+sampleData[size/2]);
         else
             System.out.println("중간값: "+sampleData[size/2]);
    }

 
public static void main(String[] args) {
    int[] sampleData = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    new ONE02(sampleData); // 생성자 호출
}

}