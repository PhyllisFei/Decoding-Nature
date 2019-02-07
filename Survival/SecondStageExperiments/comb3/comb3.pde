Human human;
FlowField flowfield;
ArrayList<Wave> waves;
ArrayList<Particle> particles;

//int interval = 120;

// *****wave color ***** //
color[] clr1 = {
  color(0, 91, 197), //dark blue
  color(0, 180, 252), //light blue
  //color(24, 26, 127), //mid blue
  color(23, 249, 255), //green blue
  //color(87, 133, 225), // purple blue
};
// ***** sun color ***** //
color[] clr2 = {
  color(255, 199, 137), //light orange yellow
  color(244, 129, 79), //mid orange yellow
  color(255, 85, 2), //orange yellow
  color(232, 54, 1), //red
  color(225, 66, 43), //lighter red
};

void setup() {
  size(1280, 800);
  background(0);

  // ***** add waves *****//
  flowfield = new FlowField(10); //initial: 20
  waves = new ArrayList<Wave>();
  for (int i = 0; i < 5000; i++) {
    waves.add(new Wave(new PVector(random(width), random(height/4*3-noise(frameCount*.01), height)), 
    random(1, 3), random(0.01, 0.05)));
    //waves.add(new Wave(new PVector(0, random(height/4*3-noise(frameCount*.01), height)),
    //random(1, 3), random(0.01, 0.05)));
  }

  // ***** generate one sun ***** //
  particles = new ArrayList<Particle>();
  for (int i=0; i<1; i++) {
    particles.add(new Particle( -15, height/3, random(15, 20) ));
  }

  human = new Human(-15, height/3, 10);
}


void draw() {
  // ***** sun area ***** //
  pushMatrix();
  pushStyle();
  fill(0, 20);
  rect(0, 0, width, height/4*3-20);
  popStyle();
  popMatrix();

  // ***** wave area ***** //
  pushMatrix();
  pushStyle();
  fill(0, 40);
  rect(0, height/4*3-20, width, height);
  popStyle();
  popMatrix();

  // ***** draw sun with mouse interaction ***** //
  human.pos.x = mouseX;
  human.pos.y = mouseY;
  human.display();  

  // ***** waves ***** //
  flowfield.update();
  for (Wave w : waves) {
    w.follow(flowfield);
    w.run();
  }

  // ***** display suns ***** //
  for (Particle p : particles) {
    p.run();
  }

  // ***** add 5 suns in total ***** //
  if (particles.size() < 5) {
    if (mousePressed)
    //if (frameCount % interval  == 0) {
    for (int i=0; i<1; i++) {
      particles.add(new Particle( mouseX, mouseY, random(15, 20) ));
    }
    //interval -= 10;
    //}
  }
}
