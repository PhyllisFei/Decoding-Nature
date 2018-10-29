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
    //float forceMag = ( (mass * d.mass)/distance);
    float forceMag = ( .65*mass/distance); //final printed version

    if (distance > 200) {
      //force.mult(forceMag/.2);
      force.mult(forceMag/.0008); //final printed version
      //force.mult(-forceMag/.005);
    } 
    else {
      //force.mult(-forceMag*10);
      //force.mult(-forceMag*50);
      force.mult(forceMag/50); //final printed blue version (not applied to the red version)
    }
    return force;
  }

  void display() {
    //ellipse(pos.x, pos.y, 80, 80);
  }
}
