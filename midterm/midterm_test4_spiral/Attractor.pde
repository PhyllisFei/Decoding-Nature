class Attractor {
  float mass;
  PVector pos;
  //PVector vel, acc;
  
  Attractor(float x, float y, float _mass) {
    mass = _mass;

    pos = new PVector (x, y);
    //acc = new PVector (0, 0);
    //vel = new PVector (0, 0);
  }

  PVector attractionForce(Dot d) {
    PVector force = PVector.sub(pos, d.pos);

    float distance = force.mag();
    force.normalize();

    distance *= distance;
    //distance = constrain(distance, 5, 50);
    float forceMag = ( (mass * d.mass)/distance );
    force.mult(forceMag/3);
    return force;
  }

  //void update() {  
  //  vel.x += 2;
  //  vel.y += 1.5;

  //  vel.add(acc);
  //  pos.add(vel);
  //  acc.mult(0);
  //}

  void display() {
    //ellipse(pos.x, pos.y, 30, 30);
  }
}
