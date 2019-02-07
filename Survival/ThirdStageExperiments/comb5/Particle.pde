class Particle {
  PVector pos, vel, acc;
  PVector dest;
  float mass, rad, angle;
  ArrayList<Sun> suns;

  Particle(float x, float y, float m) {
    x = rad * cos(angle);
    y = rad * sin(angle);
    pos = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();
    mass = m;
    rad = mass*1;

    suns = new ArrayList();
    for (int i = 0; i < 60; i++) {
      suns.add(new Sun(pos, PI*i/30, rad));
    }
  }

  void attractedTo(PVector human) {
    PVector vector = PVector.sub(human, pos);
    float distance = vector.mag();

    // ***** dynamic movement around mouse position ***** //
    if (distance > 15 ) {
      // pull the sun to the mouse position
      vector.mult(0.8);
      applyForce(vector);
    } else {
      // push back
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

  void repel(Particle otherp) {
    PVector vector = PVector.sub(otherp.pos, pos);
    float distance = vector.mag();
    if (distance < 10) {
      vector.mult(-0.01);
      applyForce(vector);
    }
  }

  // //***** check the collision ***** //
  void checkCollision(Particle otherp) {
    PVector vector = PVector.sub( otherp.pos, pos );
    float distanceSq = vector.magSq();

    if (distanceSq < 400){ //(rad + otherp.rad) * (rad + otherp.rad))
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

    angle += .01;
    rad += .05;
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
      //for (Particle otherp : particles) {
      //  if (p != otherp) {
      //    p.checkCollision(otherp);
      //  }
      //}   
      p.attractedTo( human.pos );
      p.applyRestitution(-0.30);
      //p.applyRestitution(0.00010); //acc
      p.update();
      p.display();
    }
  }
}
