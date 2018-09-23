class Attractor {
  float mass;
  PVector pos;

  Attractor(float x, float y, float _mass) {
    pos = new PVector (x, y);
    mass = _mass;
  }

  PVector attractionForce(Mover m){
    PVector force = PVector.sub(pos, m.pos);
    float distance = force.mag();
    force.normalize();
    float g = 1;
    distance *= distance;
    distance = constrain(distance, 5, 50);
    float forceMag = ( (mass * m.mass)/distance );
    force.mult(-forceMag/2);
    return force;
  }
  
    void display(){
    ellipse(pos.x, pos.y, 60, 60);
  }
}
