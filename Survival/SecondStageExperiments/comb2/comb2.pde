FlowField flowfield;
ArrayList<Wave> waves;
ArrayList<Dot> dots;
Attractor a;

//wave color
color[] clr1 = {
  color(0, 91, 197), //dark blue
  color(0, 180, 252), //light blue
  //color(24, 26, 127), //mid blue
  color(23, 249, 255), //green blue
  //color(87, 133, 225), // purple blue
};
//sun color
color[] clr2 = {
  color(255, 199, 137), //light orange yellow
  color(244, 129, 79), //mid orange yellow
  color(255, 85, 2), //orange yellow
  color(232, 54, 1), //red
  color(225, 66, 43), //lighter red
};

boolean begin = false;
boolean debug = true;

void setup() {
  size(1280, 800, P2D);
  background(0);
  noStroke();
  smooth();

  //add waves
  flowfield = new FlowField(10); //initial: 20
  waves = new ArrayList<Wave>();
  for (int i = 0; i < 5000; i++) {
    waves.add(new Wave(new PVector(random(width), random(height/4*3-noise(frameCount*.01), height)), 
      random(1, 3), random(0.01, 0.05)));
  }

  //add sun
  dots = new ArrayList<Dot>();
  for (int i = 0; i<800; i++) {
    dots.add (new Dot( random(-15, 0), random(height/3, height/3+10), random(1, 5) ));
  }

  //initialize attractor
  a = new Attractor(0, 0, 10);
}

void draw() {
  //sun area
  pushMatrix();
  pushStyle();
  fill(0, 10);
  rect(0, 0, width, height/4*3-20);
  popStyle();
  popMatrix();

  //wave area
  pushMatrix();
  pushStyle();
  fill(0, 50);
  rect(0, height/4*3-20, width, height);
  popStyle();
  popMatrix();

  flowfield.update();
  for (Wave w : waves) {
    w.follow(flowfield);
    w.run();
  }

  //draw sun with mouse interaction
  a.pos.x = mouseX;
  a.pos.y = mouseY;
  a.display();  

  for (Dot d : dots) {
    PVector force = a.attractionForce(d);
    d.applyForce(force);

    d.update();
    d.applyRestitution(-0.03);
    d.display();
  }

  //if (debug) //flowfield.display();
}

void mouseMoved() {
  begin = true;
}

void keyPressed() {
  if (key == ' ') debug = !debug;
}
