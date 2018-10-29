class Dot {
  float mass;
  PVector pos, vel, acc;

  float radius;
  float angle = 0;
  float startAngle;
  float freq = 0.1;


  Dot(float x, float y, float _mass) {
    mass = _mass;
    angle = startAngle;
    radius = 15;

    pos = new PVector (x, y);
    vel = new PVector (0, 0);
    acc = new PVector (0, 0);
  }

  //void applyForce(PVector force) {
  //  PVector f = PVector.div(force, mass);
  //  acc.add(f);
  //}

  void update() {
    angle += freq;
    startAngle += .01;
    radius += .05;
    
    pos.x += radius * cos(angle)*.3;
    pos.y += radius * sin(angle)*.7;

    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void display() {
    pushMatrix();
    fill(0);
    ellipse(pos.x, pos.y, mass, mass);
    popMatrix();
  }

  void connectLine1(Dot other) {
    float dist = dist(pos.x, pos.y, other.pos.x, other.pos.y);
    if (dist < 8 && dist > 3) {
      //if (dist < 150 && dist > 10){
      float alpha = map(dist, 3, 8, 80, 20);
      stroke(0, alpha);
      line(pos.x*sin(angle), pos.y*cos(angle), other.pos.x, other.pos.y);
    }
  }

  //void connectLine2() {
  //  //float dist = dist(x, y, x, height/2);
  //  float dist = dist(pos.x, pos.y, random(width), random(height));

  //  if (dist > 500) {
  //    float alpha = map(dist, 150, 500, 10, 0);
  //    //float alpha = map(dist, 150, 500, 1, 0);
  //    stroke(0, alpha);
  //    strokeWeight(0.01);

  //    //***** img1.2&1.3_vertical: straight pattern
  //    line(pos.x, pos.y+random(-10, 10), pos.x, height/2);

  //    //***** img1.4_vertical: symmetrical pattern with randomness
  //    //line(x+random(-80, 80), y+random(-10, 10), x, random(height));

  //    //***** img1.5_semi-transparent lines as bgc
  //    //    line(x+random(-80, 80), y+random(-10, 10), random(x), random(y));
  //  }
  //}
}
