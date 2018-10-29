class Spring {
  PVector anchor;
  float restingLength;
  float k;

  Spring(float x, float y, float len) {
    anchor = new PVector(x, y);
    restingLength = len;
    k = .1;
  }
  void update(Ball b) {
    PVector force = PVector.sub(b.position, anchor);
    float stretch = force.mag() - restingLength;

    force.normalize();
    force.mult(k*stretch*(-1));
    b.applyForce(force);
  }

  void display(Ball b) {
    line(anchor.x, anchor.y, b.position.x, b.position.y);
  }
}
