class Attractor {
  float mass;
  float G;
  PVector pos;

  Attractor(float x, float y, float m) {
    pos = new PVector(x, y);
    mass = m;
    G = 1;
  }

  PVector attractionForce(Dot d) {
    PVector force = PVector.sub(pos, d.pos);
    float dist = force.mag();
    force.normalize();
    float strength = (G * mass * d.mass) / (dist*dist);

//50, 300, -15
    if (dist>50) {
      force.mult(strength * 500);
    } else {
      force.mult(strength * -10);
    }
    
    return force;
  }

  void display() {
    //
  }
}
