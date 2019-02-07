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

    if (dist>50) {
      force.mult(strength * 200);
    } else {
      force.mult(strength * -1);
    }
    
    return force;
  }

  void display() {
    //println(pos.x);  
  }
}
