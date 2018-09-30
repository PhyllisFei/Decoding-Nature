class Dot {
  float mass = 1;
  float x, y;

  Dot(float _x, float _y) {
    x = _x;
    y = _y;

    angle = startAngle;
  }

  void update() {
    y = random( -sin(angle) * amp + height/2, sin(angle) * amp + height/2);
    //y =  sin(angle) * amp + height/2;
    //x =  cos(angle) * amp ;
    //float a = sin(angle) * amp;
    //y += a;

    angle += freq;
    startAngle += .01;
    //freq.mult(0);
    //constrain(freq, 0, 0.00000001);
  }

  void display() {
    pushMatrix();
    fill(0);
    ellipse(x, y, mass, mass);
    popMatrix();
    println(y);
  }

  void connectLine1(Dot other) {
    float dist = dist(x, y, other.x, other.y);
    if (dist < 50 && dist > 30){
      float alpha = map(dist, 0, 800, 30, 0);
      stroke(0, alpha);
      line(x, y, other.x, other.y);
    }
  }

  void connectLine2() {
    float dist = dist(x, y, x, height/2);
    if (dist > 150){
      float alpha = map(dist, 150, 500, 100, 0);
      stroke(0, alpha);
      strokeWeight(0.01);
      line(x, y+random(-10, 10), x, height/2);
    }
  }
}
