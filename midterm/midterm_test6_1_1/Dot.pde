class Dot {
  PVector pos, vel, acc;
  float mass;
  //float angle1, angle2, r;
  //float attraction;

  Dot(float x, float y, float m) {
    x = cos(angle)*r;
    y = sin(angle)*r;
    mass = m;
    r = 1.0*randomGaussian() + (width/2-100)*(1.0-pow(random(1.0), 7.0));
    angle = random(TWO_PI);

    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void attract(Dot otherd) {
    PVector force = PVector.sub(pos, otherd.pos);
    float distance = force.mag();
    //angle2 = force.heading();

    //attraction = 1/distance; 
    if (distance < 2) {
      force.mult(-.03);
      ////vector.mult(-0.1*sin(mass/10));
      applyForce(force);
      //attraction = -attraction;
    }
    //attraction *= .8;
  }

  void update() {
    //vel.add(acc);
    //pos.add(vel);
    //acc.mult(0);
    //pos.x += attraction * cos(angle2);
    //pos.y += attraction * sin(angle2);
  }

  void checkEdges() {
    if (pos.x > 700-width/2) {
      pos.x = 700;
    }
    if (pos.x < 100) {
      pos.x = 100;
    }
    if (pos.y > 700-height/2) {
      pos.y = 700;
    }
    if (pos.y < 100) {
      pos.y = 100;
    }
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(pos.x+width/2, pos.y+height/2, mass, mass);
  }
}
