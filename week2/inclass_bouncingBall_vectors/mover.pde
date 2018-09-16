class Mover {
  PVector pos, vel, acc;
  
  Mover() {
    pos = new PVector(width/2, height/2);
    vel = PVector.random2D(); // to get a random velocity
    vel.mult(5); // to scale
    acc = new PVector(.05, .05);
  }

  void update(PVector _acc) {
    acc = _acc;
    pos.add(vel);
    vel.add(acc);
    vel.limit(10);
  }

  void display() {
    ellipse(pos.x, pos.y, 30, 30);
  }

  void checkEdges() {
    if (pos.x>width || pos.x<0) {
      vel.x *= -1;
      acc.x *= -1;
    }
    if (pos.y>height || pos.y<0) {
      vel.y *= -1;
      acc.y *= -1;
    }
  }
}
