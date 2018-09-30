// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float aAcc, aVel, angle;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(1, 0);
    acceleration = new PVector(0, 0);
    aVel = angle = 0;
    aAcc = 0;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);

    aAcc = acceleration.x/10;
    aVel += aAcc;
    angle += aVel;
    aVel = constrain(aVel, -0.1, 0.1);

    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0, 100);
    rectMode(CENTER);
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    rect(0, 0, mass*25, mass*25);
    popMatrix();
  }
}
