ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Sun> suns = new ArrayList<Sun>();

Human human;

int interval = 120;

color[] clr2 = {
  color(255, 199, 137), //light orange yellow
  color(244, 129, 79), //mid orange yellow
  color(255, 85, 2), //orange yellow
  color(232, 54, 1), //red
  color(225, 66, 43), //lighter red
};

void setup() {
  size(960, 640);
  background(0);

  // ***** generate new suns ***** //
  for (int i=0; i<1; i++) {
    //particles.add(new Particle( random(width/2-50, width/2+50), random(height/2-50, height/2+50), random(10, 15) ));
    particles.add(new Particle( -15, 20, random(30, 50) ));
    // ***** generate new suns ***** //
  }

  human = new Human(-15, 20, 10);
}


void draw() {
  //pushMatrix();
  //pushStyle();
  fill(0, 30);
  rect(0, 0, width, height);
  //popStyle();
  //popMatrix();
  noStroke();

  //draw sun with mouse interaction
  human.pos.x = mouseX;
  human.pos.y = mouseY;
  human.display();  

  for (Particle p : particles) {  
    // ***** seperate suns ***** //
    for (Particle otherp : particles) {
      if (p != otherp) {
        p.checkCollision(otherp);
      }
    }   
    // ***** seperate suns ***** //

    p.attractedTo( human.pos );
    p.applyRestitution(-0.10);
    //p.applyRestitution(0.00010); // acce
    p.update();
    p.display();
  }

  if (particles.size() < 10) {
    if(mousePressed)
    //if (frameCount % interval  == 0) {
      for (int i=0; i<1; i++) {
        //particles.add(new Particle( width/2 + random(-1, 1), height/2 + random(-1, 1), random(10, 15) ));
        particles.add(new Particle( mouseX, mouseY, random(10, 15) ));
      }
      //interval -= 10;
    //}
  }

  //for (Sun s : suns) {
  //  PVector force = human.attractionForce(s);
  //  s.applyForce(force);

  //  s.update();
  //  s.applyRestitution(-0.00003);
  //  s.display();
  //}
  fill(255);
  text(particles.size(), 10, 20);
}

/*
void keyPressed() { 
 for (int i=0; i<1; i++) {
 particles.add(new Particle( width/2 + random(-1, 1), height/2 + random(-1, 1), random(30,50) ));
 int lastIndex = particles.length - 1;
 // simple random velocity
 particles[lastIndex].vel = createVector(random(-50, 50),random(-50, 50));
 
 // ***** circular random velocity with sine and cosine ***** //
 float angle = random(PI * 2);
 float distance = random(100);
 float x = cos(angle) * distance;
 float y = sin(angle) * distance;
 particles[lastIndex].vel = new PVector(x,y);
 // ***** circular random velocity with sine and cosine ***** //
 float angle = random(PI * 2);
 float distance = random(100);
 PVector vector = PVector.fromAngle(angle);
 vector.mult(distance);
 particles[lastIndex].vel = vector;    
 }
 }*/
