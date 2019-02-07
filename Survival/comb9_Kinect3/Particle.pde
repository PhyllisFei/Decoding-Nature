class Particle {
  PVector pos, vel, acc;
  PVector dest;
  float mass, rad, angle;

  Particle(float x, float y, float m) {
    x = rad * cos(angle);
    y = rad * sin(angle);
    pos = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();
    mass = m;
    rad = mass*1;

    suns = new ArrayList();
    // ***** place dots in a circular shape ***** //
    for (int i = 0; i < 150; i++) { //80
      suns.add(new Sun(pos, PI*i/40, rad + random(-12, 12)));
    }
  }

  void attractedTo(PVector human) {
    PVector vector = PVector.sub(human, pos);
    float distance = vector.mag();

    // ***** dynamic movement around mouse position ***** //
    if (distance > 15 ) {
      // ***** pull the sun to the mouse position ***** //
      vector.mult(0.8);
      applyForce(vector);
    } else {
      // ***** push back ***** //
      vector.mult(-0.0005);
      applyForce(vector);
    }
  }

  void applyForce(PVector force) {
    PVector f = new PVector();
    f = force.copy();
    f.div(mass);
    acc.add(f);
  }

  void applyRestitution( float amount ) {
    float value = 1.0 + amount;
    vel.mult(value);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);

    angle += .01;
    rad += .05;
  }

  void display() {
    for (Sun s : suns) {
      s.update();
      s.display();
    }
  }

  void run() {
    for (Particle p : particles) {
      p.applyRestitution(-0.30);
      p.update();
      p.display();
    }
  }
}
