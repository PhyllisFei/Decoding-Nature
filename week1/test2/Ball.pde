class Ball {
  PVector pos;
  PVector vel;
  PVector acc;

  Ball() {
    pos = new PVector( random(0,width), random(0,height) );
    vel = new PVector(random(-4, 4), random(-4, 4));
    acc = new PVector(0.5, 1.5);
  }

  void move() {
    pos.add(vel);
    vel.add(acc);
  }

  void update() {
    if (pos.x>width || pos.x<0) {
      vel.x = -vel.x;
    }
    if (pos.y>height || pos.y<0) {
      vel.y = -vel.y;
    }
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, 5, 5);
  }
}
