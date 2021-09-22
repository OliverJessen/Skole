import java.util.Random;
import java.util.Arrays;

public class AlgoritmeBeregning{

  public static void main(String[] args){
    int lengthArray     = Integer.parseInt(args[0]);
    int numberOfArrays  = Integer.parseInt(args[1]);
    System.out.println(lengthArray + " " + numberOfArrays);

    for(int j=0; j < numberOfArrays; j++){
      int[] list = AlgoritmeBeregning.generateRandomArray(lengthArray);
      printArray(list);
      System.out.println(" sorteringstid " + beregnSorteringsTid(list));
      //sort og tag tid
    }
  }

  public static int[] generateRandomArray(int lengthArray){
    int[] liste = new int[lengthArray];
    Random random = new Random();

    for(int i =0; i < lengthArray; i++){
      liste[i] = random.nextInt(lengthArray) + 1;
    }


    return liste;
  }

  public static void printArray(int[] list){
    System.out.print("Random array: ");
      for(int i : list){
        System.out.print(i + " ");

      }
  }

public static long beregnSorteringsTid(int[] list){
  long start = System.nanoTime();
  sorteringAfTal(list);
  long finish = System.nanoTime();
  long timeElapsed = finish - start;
  return timeElapsed;
}

public static void sorteringAfTal(int[] list){
  Arrays.sort(list);
}

//GennemsnitTid

//        5 arrays	10 arrays
//5 tal	  146151,2	47083,7
//10 tal	125481,4	27662,5
//20 tal	35492,4	  25326,9



}
