Flow[] flows = new Flow[10000];
int flowsCount = 2000;

color[] clr = {
  color(0, 91, 197), //dark blue
  color(0, 180, 252), //mid blue
  color(23, 249, 255), //green blue
  //color(151, 229, 218), // green
  color(87, 133, 225), // purple blue

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
