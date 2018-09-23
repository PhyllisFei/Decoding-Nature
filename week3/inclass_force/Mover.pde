class Mover {
  PVector pos, vel, acc;
  float mass;

  Mover(float x, float y, float _mass) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = _mass;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    //force.div(mass);
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void checkEdges() {
    if (pos.x>width) {
      //vel.x *= -1;
      pos.x = width;
    }
    if (pos.x<0) {
      vel.x *= -1;
      pos.x = 0;
    }
    if (pos.y>height) {
      vel.y *= -1;
      pos.y = height;
    }
  }

  void display() {
    fill(255);
    ellipse(pos.x, pos.y, mass, mass);
  }
}
