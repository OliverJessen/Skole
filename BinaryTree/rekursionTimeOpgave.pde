void setup() {
  //sætter en værdi for funktionens parameter.
  rekursiv(5);
}

int rekursiv(int i) {
  //kører funktionen indtil at i = 0 for hver gang.
  if (i > 0)
    i = rekursiv(i-1); 
  //Når den endelig printer, tager den rekursiv 5, 4, 3...  
  println(i); 
  //når i = 0, returnerer funktionen i's værdi for den gang.
  return(i);
}
