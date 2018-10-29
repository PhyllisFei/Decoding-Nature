class Attractor {
  float mass;
  PVector pos;

  Attractor(float x, float y, float _mass) {
    mass = _mass;

    pos = new PVector (x, y);
  }

  PVector attractionForce(Dot d) {
    PVector force = PVector.sub(pos, d.pos);
    float distance = force.mag();
    force.normalize();
    distance *= distance;
    float forceMag = ( (mass * d.mass)/distance );

    if (distance > 50) {
      force.mult(forceMag/.2);
    } else {
      force.mult(-forceMag*10);
    }
    return force;
  }

  void display() {
    //ellipse(pos.x, pos.y, 30, 30);
  }
}
