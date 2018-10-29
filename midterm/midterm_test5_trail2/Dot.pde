class Dot {
  PVector pos, vel, acc;
  float mass;
  float alpha, r, g, b;

  Dot(float x, float y, float _mass) {
    pos = new PVector (x, y);
    vel = new PVector (0, 0);
    acc = new PVector (0, 0);
    mass = _mass;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);

    float dist = dist(pos.x, pos.y, width/7*5, height/2);

    //if (dist < 300) {
    //  alpha = map(dist, 0, 255, 180, 80);
      
    //  r = map(dist, 0, 280, 0, 100);
    //  g = map(dist, 280, 0, 200, 110);
    //  b = map(dist, 0, 390, 250, 0);
    //}
  }

  void repel( PVector target) {
    PVector vector = PVector.sub(target, pos);
    float distance = vector.mag();
    if (distance < 100) {
      vector.mult(-0.1);
      //vector.mult(-0.1*sin(mass/10));
      applyForce(vector);
    }
  }

  void applyRestitution(float amount) {
    float value = 1.0 + amount;
    vel.mult(value);
  }

  void display() {
    pushMatrix();
    noStroke();
    //fill(r, g, b, alpha);
    fill(0, 50);
    //int c = (int) (clr.length*100*noise(10) % clr.length);
    //fill(clr[c], 30);
    ellipse(pos.x, pos.y, mass*2, mass*2);
    popMatrix();
  }
}
