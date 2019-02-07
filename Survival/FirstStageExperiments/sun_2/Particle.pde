class Particle {
  PVector pos, vel, acc;
  PVector dest;
  float mass, rad;
  boolean isHidden;

  Particle(float x, float y, float m) {
    pos = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();
    mass = m;
    rad = mass * 1;

    isHidden = false;

    for (int i = 0; i < 40; i++) {
      suns.add(new Sun(pos, PI*i/20, rad));
    }
  }

  void applyForce(PVector force) {
    PVector f = new PVector();
    f = force.copy();
    f.div(mass);
    acc.add(f);
  }

  void attractedTo(PVector human) {
    PVector vector = PVector.sub(human, pos);
    float distance = vector.mag();
    // float distance1 = dist (pos.x, pos.y, mouseX, mouseY);

    // a dynamic movement around mouse position
    if (distance > 15 ) {
      // pull the particles to the mouse position
      vector.mult(0.055);
      applyForce(vector);
    } else {
      // push back
      vector.mult(-0.0005); //-0.035
      applyForce(vector);
    }
  }

  void repel(Particle otherp) {
    PVector vector = PVector.sub(otherp.pos, pos);
    float distance = vector.mag();
    if (distance < 10) {
      vector.mult(-0.01);
      applyForce(vector);
    }
  }

  void checkCollision(Particle otherp) {
    PVector vector = PVector.sub( otherp.pos, pos );
    float distanceSq = vector.magSq();

    // check the collision
    if (distanceSq < (rad + otherp.rad) * (rad + otherp.rad)) {
      vector.mult(-0.5);
      applyForce(vector);
    }
  }

  void applyRestitution( float amount ) {
    float value = 1.0 + amount;
    vel.mult(value);
  }

  void update() {
    if (isHidden == false) {
      vel.add(acc);
      pos.add(vel);
      acc.mult(0);
    }
  }

  void display() {
    if (!isHidden) {
      noStroke();
      //ellipse( pos.x, pos.y, random(1, 5), random(1, 5) );

      for (Sun s : suns) {
        for (Sun other : suns) {
          if (s != other) {
            s.checkCollision(other);
          }
        }
        s.update();
        s.display();
      }
    }
  }
}
