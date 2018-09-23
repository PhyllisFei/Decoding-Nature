class Attractor {
  float mass;
  float G;
  PVector pos;

  Attractor(float x, float y, float m) {
    pos = new PVector(x, y);
    mass = m;
    G = 1;
  }

  PVector attractionForce(Tadpole t) {
    PVector force = PVector.sub(pos, t.pos);
    float d = force.mag();
    force.normalize();
    float strength = (G * mass * t.mass) / (d*d);

    if (d>130) {
      force.mult(strength * 1200);
    } else {
      force.mult(strength * -500);
    }
    
    return force;
  }

  void display() {
    //println(pos.x);  
  }
}
