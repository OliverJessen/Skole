float angle;
float rotation;
float r = 100;
PImage earth;
PShape globe;
PVector yAxis = new PVector(0, 1, 0);
PVector zAxis = new PVector(0, 0, 1);
PVector sat1;
PVector sat2;

JSONObject j;
JSONArray positionsJson;
JSONObject pos1;
JSONObject pos2;

float sat1Lon;
float sat1Lat;
float sat1Alt;

float sat2Lon;
float sat2Lat;
float sat2Alt;

float theta;
float phi;
float x;
float y;
float z;

float tid = 0;

float k = 0;
float afstandJorden;
float v;


PVector rotationAxis = new PVector();
PVector afstandSatellit = new PVector();
float afstandPunkter;

void setup() {
  size(800, 800, P3D);
  earth = loadImage("earth.jpg");
  noStroke();
  globe = createShape(SPHERE, r);
  globe.setTexture(earth);

  j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=GUEEAL-Z7MBKJ-CPLJWD-4SOY");
  positionsJson = j.getJSONArray("positions");
  pos1 = positionsJson.getJSONObject(0);
  pos2 = positionsJson.getJSONObject(1);

  sat1Lon = pos1.getFloat("satlongitude");
  sat1Lat = pos1.getFloat("satlatitude");
  sat1Alt = pos1.getFloat("sataltitude");
  sat2Lon = pos2.getFloat("satlongitude");
  sat2Lat = pos2.getFloat("satlatitude");
  sat2Alt = pos2.getFloat("sataltitude");

  sat1 = new PVector(sat1Lon, sat1Lat, sat1Alt);
  sat2 = new PVector(sat2Lon, sat2Lat, sat2Alt);

  theta = radians(sat2Lat);
  phi = radians(sat2Lon) + PI;
  x = -r * 1.2 * cos(theta) * cos(phi);
  y = -r * 1.2 * sin(theta);
  z = -r * 1.2 * cos(theta) * sin(phi);

  PVector tempVector = new PVector(x, y, z);

  theta = radians(sat1Lat);
  phi = radians(sat1Lon) + PI;
  x = -r * 1.2 * cos(theta) * cos(phi);
  y = -r * 1.2 * sin(theta);
  z = -r * 1.2 * cos(theta) * sin(phi);

  PVector.cross(tempVector, new PVector(x, y, z), rotationAxis);

  tid += 1;

  afstandJorden = sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));
  afstandSatellit = new PVector(sat2.x - sat1.x, sat2.y - sat1.y, sat2.z - sat1.z);
  afstandPunkter = sqrt(pow(afstandSatellit.x, 2) + pow(afstandSatellit.y, 2) + pow(afstandSatellit.z, 2));
  v = 20 * (2* asin(afstandPunkter/(2*afstandJorden)));
}

void draw() {

  background(51);
  text(sat1Lon + " + " + sat1Lat + " + " + sat1Alt, 10, 50);
  text(sat2Lon + " + " + sat2Lat + " + " + sat2Alt, 10, 80);
  translate(width*0.5, height*0.5);
  rotateY(angle);

  lights();
  fill(200);
  noStroke();
  shape(globe);

  //satellit med aktuelle koordinater
  pushMatrix();
  rotate(rotation, rotationAxis.x, rotationAxis.y, rotationAxis.z);
  translate(x, y, z);
  box(15, 5, 5);
  popMatrix();

  rotation += v*0.5;
  angle += 0.003;
}
