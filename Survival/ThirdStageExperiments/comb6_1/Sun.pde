class Sun {
  PVector pos, vel, acc;
  float angle, rad, mass;
  float dist;
  int c;

  Sun (PVector pos_, float angle_, float dist_) {
    pos = pos_;
    vel = new PVector();
    acc = new PVector();
    angle = angle_;
    dist = dist_;
    mass = random(1, 5);
  }

  void applyForce(PVector force) {
    PVector f = new PVector();
    f = force.copy();
    f.div(mass);
    acc.add( f );
  }

  void applyRestitution(float rest) {
    float value = 1.0 + rest; // - 1.5;
    vel.mult(value);
  }

  void checkCollision(Sun other) {
    PVector vector = PVector.sub(other.pos, pos);
    float distanceSq = vector.magSq();

    // check the collision
    if (distanceSq < (rad+other.rad) / (rad+other.rad)) {
      vector.mult(-0.005);
      applyForce(vector);
    }
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    angle += .01;
    if (rad<2.5) rad += .008;
  }

  void display() {
    float x = pos.x + random(sin(angle) * dist * rad-3, sin(angle) * dist * rad+3);
    float y = pos.y + random(cos(angle) * dist * rad-3, cos(angle) * dist * rad+3);
    ellipse( x, y, random(.5, 3), random(.5, 3));
    fill(255, 180);
    //fill(0, 180);
  }
}
