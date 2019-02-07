class Human{
  float mass;
  float G;
  PVector pos;

  Human(float x, float y, float m) {
    pos = new PVector(x, y);
    mass = m;
    G = 1;
  }

// ***** calculate attraction force according to the distance ***** //
  PVector attractionForce(Particle p) {
    PVector force = PVector.sub(pos, p.pos);
    float dist = force.mag();
    force.normalize();
    float strength = (G * mass * p.mass) / (dist*dist);

//50, 300, -15
    if (dist>50) {
      force.mult(strength * 5000);
    } else {
      force.mult(strength * -1000);
    }
    return force;
  }

  void display() {
    //
  }
}
