class Dot {
  float mass = 1;
  float x, y;

  Dot(float _x, float _y) {
    x = _x;
    y = _y;

    angle = startAngle;
  }

  void update() {
    y = random( -sin(angle) * amp + random(height), sin(angle) * amp + random(height));
    y += cos(angle*3)*100;

    angle += freq;
    startAngle += .01;
  }

  void display() {
    pushMatrix();
    fill(0);
    ellipse(x, y, mass*16, mass*16);
    popMatrix();
  }

  void connectLine1(Dot other) {
    float dist = dist(x, y, other.x, other.y);
    if (dist < 100*16 && dist > 30*16){
      //if (dist < 150 && dist > 10){
      float alpha = map(dist, 0, 600*16, 100*16, 0);
      stroke(0, alpha);
      line(x, y, other.x, other.y);
    }
  }

  void connectLine2() {
    //float dist = dist(x, y, x, height/2);
    float dist = dist(x, y, random(width), random(height));
    
    if (dist > 150*16){
      float alpha = map(dist, 150*16, 500*16, 10*16, 0);
      //float alpha = map(dist, 150, 500, 1, 0);
      stroke(0, alpha);
      strokeWeight(0.01*16);
      
      //***** img1.2&1.3_vertical: straight pattern
      //line(x, y+random(-10, 10), x, height/2);
      
      //***** img1.4_vertical: symmetrical pattern with randomness
      //line(x+random(-80, 80), y+random(-10, 10), x, random(height));
      
      //***** img1.5_semi-transparent lines as bgc
      line(x+random(-80*16, 80*16), y+random(-10*16, 10*16), random(x), random(y));
    }
  }
}
