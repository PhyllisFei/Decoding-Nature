import org.openkinect.processing.*;
Human human;

import processing.sound.*;
SoundFile file;

FlowField flowfield;
ArrayList<Wave> waves;
ArrayList<Particle> particles;
ArrayList<Sun> suns;

float amp;
boolean devour;

// *****wave color ***** //
color[] clr1 = {
  color(24, 26, 127), //darker blue
  color(21, 2, 180), //dark blue
  //color(0, 91, 197), //mid blue
  color(87, 133, 225), // purple blue
  color(0, 180, 252), //light green blue
  color(23, 249, 255), //greener blue
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
  //size(1280, 800, P2D);
  fullScreen();
  background(0);
  devour = false;

  setupGUI();

  //***** human interaction ***** //
  human = new Human(this);

  // ***** sound effect ***** //
  file = new SoundFile(this, "bg.wav");
  file.play();

  // ***** add flow field path for waves ***** //
  flowfield = new FlowField(30);

  // ***** add waves *****//
  waves = new ArrayList<Wave>();
  for (int i = 0; i < 5000; i++) {
    waves.add(new Wave(new PVector(random(width), random(650*2.25, height)), 
      random(1, 3), random(0.01, 0.05)));
  }

  // ***** generate one sun ***** //
  particles = new ArrayList<Particle>();
  for (int i=0; i<1; i++) {
    particles.add(new Particle( -30, height/3, 50));
  }
}


void draw() {
  drawbg();

  human.track();
  human.display();

  /* debug tool
   PVector v1 = human.getPos();
   fill(50, 100, 250, 200);
   noStroke();
   ellipse(v1.x*2, v1.y*2, 20, 20);
   
   PVector v2 = human.getLerpedPos();
   fill(100, 250, 50, 200);
   noStroke();
   ellipse(v2.x*2, v2.y*2, 20, 20);
   */

  // ***** volume adjustment ***** //
  //amp = map(human.pos.y, 0, height, 0.2, 0.6);
  //file.volume(amp);

  // ***** update wave path ***** //
  flowfield.update();
  //flowfield.display();

  // ***** display waves ***** //
  for (Wave w : waves) {
    w.follow(flowfield);
    w.devour(suns);
    w.run();
  }

  //if (devour) {
  //  for (int i = 0; i < 5000; i++) {
  //    waves.add(new Wave(new PVector(random(width), random(0, 250)), 
  //      random(1, 3), random(0.01, 0.05)));
  //    //println("1");
  //  }
  //}

  // ***** display suns ***** //
  for (Particle p : particles) {
    p.run();
  }

  if (GUIToogle) addGUI();
}

void keyPressed() {
  if (key == ' ') GUIToogle =!GUIToogle;
}
