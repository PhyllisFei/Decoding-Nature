import java.util.Calendar;

Flow[] flows = new Flow[10000];
int flowsCount = 2000;

color[] clr = {
  //color(0, 91, 197), 
  //color(0, 180, 252), 
  //color(23, 249, 255), 
  //color(223, 147, 0), 
  //color(248, 190, 0)

  color(138, 140, 247), 
  color(87, 133, 225), 
  color(167, 226, 252), 
  color(151, 229, 218), 
  color(175, 252, 203)
};

void setup() {
  size(1280, 800, P2D);
  background(0,5);
  smooth();

  for (int i=0; i<flows.length; i++) {
    flows[i] = new Flow();
  }
}

void draw() {
  for (int i=0; i<flowsCount; i++) {
    flows[i].update();
  }
}

void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png");
  if (key == ' ') {
    int newNoiseSeed = (int) random(100000);
    println("newNoiseSeed: "+newNoiseSeed);
    noiseSeed(newNoiseSeed);
  }
}

String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
