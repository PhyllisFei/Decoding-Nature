class Particle {
  PVector pos, vel, acc;
  PVector dest;
  float mass, rad;
  ArrayList<Sun> suns;

  Particle(float x, float y, float m) {
    pos = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();
    mass = m;
    rad = mass*1;
    //isHidden = false;

    suns = new ArrayList();
    for (int i = 0; i < 80; i++) {
      suns.add(new Sun(pos, PI*i/40, rad));
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

    // ***** dynamic movement around mouse position ***** //
    if (distance > 15 ) {
      // pull the suns to the mouse position
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

  // ***** check the collision ***** //
  void checkCollision(Particle otherp) {
    PVector vector = PVector.sub( otherp.pos, pos );
    float distanceSq = vector.magSq();

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
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void display() {
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

  void run() {
    for (Particle p : particles) {  
      // ***** seperate suns ***** //
      for (Particle otherp : particles) {
        if (p != otherp) {
          p.checkCollision(otherp);
        }
      }   
      p.attractedTo( human.pos );
      //p.applyRestitution(-0.10);
      p.applyRestitution(-0.30);
      //p.applyRestitution(0.00010); // acc
      p.update();
      p.display();
    }
  }
}
