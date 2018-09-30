// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float angle;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    angle = 0;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    velocity.mult(.98);
    acceleration.mult(0);
   
    PVector dir = PVector.sub(a.position, position);
    dir.normalize();
    dir.mult(2);
    applyForce(dir);

    angle = atan2(dir.y, dir.x); //????????
  }

  void display() {
    //angle = atan2(velocity.y, velocity.x);

    stroke(0);
    strokeWeight(2);
    fill(0, 100);
    pushMatrix();
    rectMode(CENTER);
    translate(position.x, position.y);
    rotate(angle);
    rect(0, 0, 30, 12);
    popMatrix();
  }
}
