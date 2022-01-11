import java.util.Random;
import java.util.Arrays;

public class GenetiskAlgoritme {

  static Random random = new Random();

  public static void main(String[] args) {

/*  boolean[][] population = getRandomPopulation(100);

    for(boolean[] array : population) {
      System.out.println(getValue(array) + " " + getWeight(array));
    }
*/
  boolean[] best = getBestFromPopulations(100,100, 20);
  System.out.println("DKK = " + getValue(best) + ", " + "g = " + getWeight(best));

  }

  static boolean[] getBestFromPopulations(int iterations, int size, int mutationChance) {

    boolean[][] population = getRandomPopulation(size);

    for(int i = 0; i < iterations; i++) {
      boolean[][] parents = getParentsFromPopulation(population);
      population = getPopulationFromParents(parents[0], parents[1]);

    }

    boolean[] best = getParentsFromPopulation(population)[0];

    return best;

  }

  static boolean[][] getRandomPopulation(int size) {

      boolean[][] population = new boolean[size][];

      for(int i = 0; i < population.length; i++) {

        population[i] = getRandomArray();

      }

      return population;

    }

  static boolean[][] getMutatedPopulation(boolean[][] population, int chance) {

    boolean[][] newPopulation = population.clone();

    for(int i = 0; i < newPopulation.length; i++) {

      newPopulation[i] = getMutatedArray(newPopulation[i], chance);

    }

    return newPopulation;

  }

  static boolean[][] getPopulationFromParents(boolean[] parent1, boolean[] parent2) {

    int size = parent1.length;
    boolean[][] population = new boolean[size][];

    for(int i = 0; i < population.length; i++) {

      population[i] = getArrayFromParents(parent1, parent2);

    }

    return population;

  }

  static boolean[][] getParentsFromPopulation(boolean[][] population) {

    boolean[][]parents = new boolean[2][];
    boolean[][]newPopulation = population.clone();

    for(int i = 0; i < newPopulation.length; i++) {

      if(getWeight(newPopulation[i]) > 5000) {

        newPopulation[i] = null;

      }
    }

    int parent1Index = 0;
    int parent1Value = 0;

    int parent2Index = 0;
    int parent2Value = 0;

    for(int i = 0; i < newPopulation.length; i++) {

      if(newPopulation[i] == null)
        continue;

      int value = getValue(newPopulation[i]);

      if(value > parent1Value) {
        parent2Index = parent1Index;
        parent2Value = parent1Value;
        parent1Value = value;
        parent1Index = i;

      }
      else if(value > parent2Value) {
        parent2Index = i;
        parent2Value = value;

      }
    }

    parents[0] = newPopulation[parent1Index];
    parents[1] = newPopulation[parent2Index];

    return parents;

  }

  static int getValue(boolean[] array) {

    int result = 0;

    if(array[0] == true) result += 150;
    if(array[1] == true) result += 35;
    if(array[2] == true) result += 200;
    if(array[3] == true) result += 160;
    if(array[4] == true) result += 60;
    if(array[5] == true) result += 45;
    if(array[6] == true) result += 60;
    if(array[7] == true) result += 40;
    if(array[8] == true) result += 30;
    if(array[9] == true) result += 10;
    if(array[10] == true) result += 70;
    if(array[11] == true) result += 30;
    if(array[12] == true) result += 15;
    if(array[13] == true) result += 10;
    if(array[14] == true) result += 40;
    if(array[15] == true) result += 70;
    if(array[16] == true) result += 75;
    if(array[17] == true) result += 80;
    if(array[18] == true) result += 20;
    if(array[19] == true) result += 12;
    if(array[20] == true) result += 50;
    if(array[21] == true) result += 10;
    if(array[22] == true) result += 1;
    if(array[23] == true) result += 150;

    return result;

    }

  static int getWeight(boolean[] array) {

    int result = 0;

    if(array[0] == true) result += 90;
    if(array[1] == true) result += 130;
    if(array[2] == true) result += 1530;
    if(array[3] == true) result += 500;
    if(array[4] == true) result += 150;
    if(array[5] == true) result += 680;
    if(array[6] == true) result += 270;
    if(array[7] == true) result += 390;
    if(array[8] == true) result += 230;
    if(array[9] == true) result += 520;
    if(array[10] == true) result += 110;
    if(array[11] == true) result += 320;
    if(array[12] == true) result += 240;
    if(array[13] == true) result += 480;
    if(array[14] == true) result += 730;
    if(array[15] == true) result += 420;
    if(array[16] == true) result += 430;
    if(array[17] == true) result += 220;
    if(array[18] == true) result += 70;
    if(array[19] == true) result += 180;
    if(array[20] == true) result += 40;
    if(array[21] == true) result += 300;
    if(array[22] == true) result += 900;
    if(array[23] == true) result += 2000;

      return result;
    }

  static boolean[] getRandomArray() {

    boolean[] array = new boolean[24];

    for(int i = 0; i < array.length; i++) {
    array[i] = random.nextBoolean();
  }

    return array;
  }

  static boolean[] getMutatedArray(boolean[] array, float chance) {

    boolean[] newArray = array.clone();

    for(int i = 0; i < array.length; i++)

      if(random.nextInt(100) < chance)

        array[i] = !array[i];

    return newArray;

  }

  static boolean[] getArrayFromParents(boolean[] parent1, boolean[] parent2) {

    boolean[] array = new boolean[24];

    for(int i = 0; i < array.length; i++) {

      if(random.nextBoolean()) {
        array[i] = parent1[i];
      }
      else {
        array[i] = parent2[i];
      }

    }

    return array;

  }

  static void printArray(boolean[] array) {

    System.out.println(Arrays.toString(array));

  }
}
