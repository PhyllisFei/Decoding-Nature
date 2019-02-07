boolean debug = true;

color[] clr1 = {
  color(0, 91, 197), //dark blue
  color(0, 180, 252), //light blue
  //color(24, 26, 127), //mid blue
  color(23, 249, 255), //green blue
  //color(87, 133, 225), // purple blue
};

FlowField flowfield;
ArrayList<Wave> waves;

void setup() {
  size(1280, 800, P2D);
  background(0);
  smooth();
  //frameRate(10);

  //add waves
  flowfield = new FlowField(10); //initial: 20
  waves = new ArrayList<Wave>();
  for (int i = 0; i < 1200; i++) {
    //vehicles.add(new Vehicle(new PVector(random(width), random(height/4*3-noise(frameCount*.01), height)), random(1, 3), random(0.01, 0.05)));
    waves.add(new Wave(new PVector(0, random(height/4*3-noise(frameCount*.01), height)), random(1, 3), random(0.01, 0.05)));
  }
}

void draw() {
  //pushMatrix();
  //pushStyle();
  //rect(0, 0, width, height);
  //fill(0, 10);
  //popStyle();
  //popMatrix();
  flowfield.update();

  //if (debug) //flowfield.display();

    for (Wave w : waves) {
      w.follow(flowfield);
      w.run();
    }
}

void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}
