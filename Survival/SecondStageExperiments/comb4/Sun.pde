class Sun {
  PVector pos, vel, acc;
  float angle, rad, mass;
  float distance;
  int c;

  Sun (PVector p, float angle_, float d) {
    pos = p;
    vel = new PVector();
    acc = new PVector();
    angle = angle_;
    distance = d;
    mass = random(1, 5);
  }

  void applyForce(PVector force) {
    PVector f = new PVector();
    f = force.copy();
    f.div(mass);
    acc.add( f );
  }
  
   void applyRestitution(float rest) {
    float value = 1.0 + rest-2;
    vel.mult(value);
  }

  void checkCollision(Sun other) {
    PVector vector = PVector.sub(other.pos, pos);
    float distanceSq = vector.magSq();

    // check the collision
    if (distanceSq < (rad+other.rad) / (rad+other.rad)) {
      vector.mult(-0.005); //-.5
      applyForce(vector);
    }
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    c = (int) (clr2.length*100*noise(mass) % clr2.length);
  }

  void display() {
    float x = pos.x + sin(angle) * distance;
    float y = pos.y + cos(angle) * distance;
    ellipse( x, y, random(.5, 3), random(.5, 3));
    fill(clr2[c]);
  }
}
