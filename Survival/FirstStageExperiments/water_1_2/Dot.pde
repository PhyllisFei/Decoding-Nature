class Dot {
  float x, y, mass;
  PVector pos, vel, acc;
  color c;

  Dot(float x_, float y_) {
    x = x_;
    y = y_;
    pos = new PVector(x_, y_);
    vel = new PVector();
    acc = new PVector();
    mass = 2;
    c = color(81, 115, 232);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force) {
    //PVector f = PVector.div(force, mass);
    //acc.add(f);
    acc = force;
  }

  void wave() {
    PVector mousePos = new PVector(mouseX, mouseY);
    PVector f = mousePos.sub(pos);
    f.mult(sin(random(0.0001, 0.0003)));
    applyForce(f);
  }

  void stable() {
    float posChange = dist(pos.x, pos.y, x, y);
    if (posChange>5) {
      pos.x = x;
      pos.y = y;
      vel.mult(0);
      acc.mult(0);
    }
  }
  
  void connectLine(Dot otherD) {
    float dist = dist(pos.x, pos.y, otherD.pos.x, otherD.pos.y);
    if (dist<16) {
      float strokeW = map(dist, 0, 150, 1, 0);
      float alpha = map(dist, 0, 150, 255, 0);
      stroke(c, alpha*.5);
      strokeWeight(strokeW);
      line(pos.x, pos.y, otherD.pos.x, otherD.pos.y);
    }
  }
  
  void display(PVector mousePos) {
    float dist = dist(pos.x, pos.y, mousePos.x, mousePos.y);
    float alpha = map(dist, 0, 250, 255, 0);
    noStroke();
    fill(c, alpha);
    ellipse(pos.x, pos.y, mass, mass);
  }
}
