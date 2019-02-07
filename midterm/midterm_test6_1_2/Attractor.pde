class Attractor {
  float mass;
  PVector pos;

  Attractor(float x, float y, float _mass) {
    pos = new PVector (x, y);
    mass = _mass;
  }

  PVector attractionForce(Dot d) {
    PVector force = PVector.sub(pos, d.pos);
    float distance = force.mag();
    force.normalize();
    float g = 1;
    distance *= distance;
    //distance = constrain(distance, 5, 50);
    if (distance<2) {
      float forceMag = ( (mass * d.mass)/distance );
      force.mult(-forceMag/2);
    }
    return force;
  }

  void display() {
    fill(255);
    ellipse(pos.x, pos.y, 60, 60);
  }
}
