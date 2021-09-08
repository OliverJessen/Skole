import java.util.Arrays;
import java.util.Random;

public class OliversProgram {

  public static int minNumber = 1;
  public static int maxNumber = 200;

  public static int[] ArraySort = new int[maxNumber];
  public static Random numbers = new Random();

  public static void main(String[] args){
      for(int i = 0; i < ArraySort.length; i++){
        ArraySort[i] = numbers.nextInt(maxNumber-minNumber);
    }

    System.out.println("Array før sortering:");
    System.out.println(Arrays.toString(ArraySort) + "\n");

    SortArray();
    System.out.println("\n" + "Array efter sortering:");
    System.out.println(Arrays.toString(ArraySort) + "\n");
  }

  static void SortArray() {
      ArraySort[0] = 0;

    for(int i = 1; i < ArraySort.length; i++) {
      if(ArraySort[i] < ArraySort[i-1]){
        boolean done = false;
        int checking = 1;

        while(!done) {
          if(ArraySort[i] >= ArraySort[i-checking]){

              int tempNumber = ArraySort[i];
              int[] tempArray = new int[checking-1];

              for(int n = 0; n < tempArray.length; n++){
                  tempArray[n] = ArraySort[i - checking + 1 + n];
              }

              for(int n = 0; n < tempArray.length; n++){
                  ArraySort[i - checking + 1 + n + 1] = tempArray[n];
              }
              ArraySort[i - checking + 1] = tempNumber;
              done = true;
            }
            checking++;
          }
        }
      }
    }
  }

// Psuodo kode for sorteringsprogram:
/*    for hvert index i array = i {
    if( index[i] er mindre end index[i-1]) {
    	den bliver ved med at kigge efter tal mindre end index[i]
    		laver en array med kopi af de tal imellem index[i] og index[i-checking]
    laver man kopi af index[i], og putter index[i] = index[i - checking + 1]
    for hvert index i array kopi = n = 0 {
    	array kopi [n] = [i-checking+1+1]
          }
        }
      }
    }
*/
