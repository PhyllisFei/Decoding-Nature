class Dot {
  PVector pos, vel, acc;
  float mass;
  float c1, c2;
  int c;

  Dot(float x, float y, float m) {
    mass = m;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    vel.limit(5);

    c = (int) (clr2.length*100*noise(mass) % clr2.length);
  }

  void applyRestitution(float rest) {
    float value = 1.0 + rest;
    vel.mult(value);
  }

  void display() {
    pushMatrix();
    pushStyle();
    noStroke();
    fill(clr2[c], 200);
    ellipse(pos.x, pos.y, mass, mass);
    popStyle();
    popMatrix();
  }
}
