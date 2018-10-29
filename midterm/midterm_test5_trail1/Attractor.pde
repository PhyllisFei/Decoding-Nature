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
    distance *= distance;
    float forceMag = ( (mass * d.mass)/distance);

    if (distance > 150) {
      force.mult(forceMag/.2);
      //force.mult(forceMag/.002);
      //force.mult(-forceMag/.005);
    } else {
      force.mult(-forceMag*10);
      //force.mult(-forceMag*500);
      //force.mult(forceMag/5);
    }
    return force;
  }

  void display() {
    //ellipse(pos.x, pos.y, 80, 80);
  }
}
