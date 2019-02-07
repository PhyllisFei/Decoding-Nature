import org.openkinect.processing.*;
Human human;

import processing.sound.*;
SoundFile file;

FlowField flowfield;
ArrayList<Wave> waves1;
ArrayList<Wave> waves2;
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
  file.loop();

  // ***** add flow field path for waves ***** //
  flowfield = new FlowField(30);

  // ***** add waves *****//
  waves1 = new ArrayList<Wave>();
  for (int i = 0; i < 9000; i++) {
    waves1.add(new Wave(new PVector(random(width), random(height*.7, height)), 
      random(1, 3), random(0.01, 0.05)));
  }

  waves2 = new ArrayList<Wave>();
  for (int i = 0; i < 1000; i++) {
    waves2.add(new Wave(new PVector(random(width), random(height*.63, height)), 
      random(1, 3), random(0.01, 0.05)));
  }

  // ***** generate one sun ***** //
  particles = new ArrayList<Particle>();
  //if (onlyHasChair==false) {
  for (int i=0; i<1; i++) {
    particles.add(new Particle( -30, height/3, 50));
  }
  //}
}

void draw() {
  drawbg();

  human.track();
  if(adjusting)human.display();

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

  // ***** update wave path ***** //
  flowfield.update();
  //flowfield.display();

  // ***** display waves ***** //
  for (Wave w : waves1) {
    w.follow(flowfield);
    w.devour(suns);
    w.run1();
  }

  for (Wave w : waves2) {
    w.follow(flowfield);
    w.devour(suns);
    w.run2();
  }

  // ***** display suns ***** //
  for (Particle p : particles) {
    if (onlyHasChair==false && human.humanPresent) {
      p.run();
    }
  }

  if (GUIToogle) addGUI();
}

void keyPressed() {
  if (key == ' ') GUIToogle =!GUIToogle;
  if(key == 'a') adjusting = !adjusting;
}
