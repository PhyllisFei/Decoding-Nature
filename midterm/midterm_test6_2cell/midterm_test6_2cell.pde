final static color[] cols = {
  #FF8A00, #FFD200, #749D9D, #FCF5B3, #B39500, #272429
};

//color[] clr = {
//  color(138, 140, 247), 
//  color(87, 133, 225), 
//  color(167, 226, 252), 
//  color(151, 229, 218), 
//  color(175, 252, 203)
//};

import processing.pdf.*;

ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(1280, 960);
  beginRecord(PDF, "filename.pdf"); 
  noFill();
  smooth(8);
  strokeWeight(0.7);
  //background(0, 0, 20);
  background(0);

  for (int i=0; i<200; i++) {
    particles.add( new Particle(i) );
  }
}

void draw() {
  for (Particle p : particles) {
    float attractx = 0.0;
    float attracty = 0.0;

    for (Particle o : particles) {
      if (p.id != o.id) {
        PVector v = new PVector(o.x-p.x, o.y-p.y);
        float distance = v.mag();
        float angle = v.heading();

        float attract = 1.0 / distance;
        if (distance<2.0) {
          attract = -attract;
        }
        attract *= .8;

        attractx += attract * cos(angle);
        attracty += attract * sin(angle);
      } 

      p.dx = attractx;
      p.dy = attracty;
    }
  }

  for (Particle p : particles) {
    p.update();
    p.display();
  }
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
