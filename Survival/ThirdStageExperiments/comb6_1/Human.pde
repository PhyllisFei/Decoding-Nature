class Human{
  PVector pos;

  Human(float x, float y) {
    pos = new PVector(x, y);
  }

//// ***** calculate attraction force according to the distance ***** //
//  PVector attractionForce(Particle p) {
//    PVector force = PVector.sub(pos, p.pos);
//    float dist = force.mag();
//    force.normalize();
//    float strength = (G * mass * p.mass) / (dist*dist);
    
//    println(strength);

////50, 300, -15
//    if (dist>50) {
//      force.mult(strength * 5000);
//    } else {
//      force.mult(strength * -1000);
//    }
//    return force;
//  }



//  void display() {
//    //
//  }
}
