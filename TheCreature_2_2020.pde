//Dette skulle være løsningen på "Creature Walk", men der er noget galt!
//
//Opgave 1: Læs programmet med en ven og find ud af hvordan koden fungerer (done)
//Opgave 2: Boldens øjne bevæger sig og forstørres forkert. Det skal rettes (Man går til linje 10 og 11 og ændrer int til float. Du gør dette fordi int kan ikke gange med kommatal, og zoomFactor's værdi er et kommatal, siden at det skal blive større hele tiden.
//Opgave 3: Bolden hopper ikke op og ned. Det skal fikses (hint: se ballwalk) (Jeg fjernede // fra ballwalk og ændrede ballX fra int til float, fordi at int ikke kan gange med kommatal og float kan.)
//Opgave 4: Skriv kode-kommentarer, der forklarer dine rettelser og upload til gitHub.
//Opgave 5: Aflever dokument med link på lectio (lectio registrerer ikke en kommentar som aflevering)

int   ballX             = 100 ,  ballY             = 100;
float   eyeLeftRelativeX  = 5   ,  eyeLeftRelativeY  = 5;
float   eyeRightRelativeX = 20  ,  eyeRightRelativeY = 5;   
int   speedX            = 1   ,  speedY            = 1;
float ballSize          = 50;
float eyeSize           = 5;
float zoomFactor        = 1.01;

//setup: kører kun en gang ved progam-start
// De to tegn: { } betyder kode scope. Variabler har altid et scope de lever indenfor!
void setup() {  
  size(500, 500);
}

//draw: kører default 30  gange per sekund
void draw() {                         
  float ballwalk =  sin(ballX*0.5)*10;  //svingning på +10 til -10 pixels 
  ballX         =  ballX  +  speedX;    //flytter min bold 
  ballY         =  ballY  +  speedY + ballwalk;
  ballSize      =  (ballSize*zoomFactor); //gør mit bold størrere
  eyeSize       =  (eyeSize*zoomFactor);
  eyeRightRelativeX *=zoomFactor;
  eyeRightRelativeY *=zoomFactor;
  eyeLeftRelativeX  *=zoomFactor;
  eyeLeftRelativeY  *=zoomFactor;
  
  clear();
  ellipse(ballX, ballY, ballSize, ballSize);
  ellipse(eyeLeftRelativeX + ballX, eyeLeftRelativeY + ballY, eyeSize,eyeSize);
  ellipse(eyeRightRelativeX + ballX, eyeRightRelativeY + ballY, eyeSize,eyeSize);
}
