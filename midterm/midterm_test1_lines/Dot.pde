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
    //y += cos(angle*3)*100;

    angle += freq;
    startAngle += .01;
  }

  void display() {
    pushMatrix();
    fill(0, 100);
    ellipse(x, y, mass, mass);
    //ellipse(x, y, mass/3, mass/3); //printed index
    popMatrix();
  }

  void connectLine1(Dot other) {
    float dist = dist(x, y, other.x, other.y);
    if (dist < 100 && dist > 30){
      //if (dist < 150 && dist > 10){
      float alpha = map(dist, 0, 600, 100, 0);
      stroke(0, alpha);
      //stroke(0, alpha-5); //printed index
      line(x, y, other.x, other.y);
    }
  }

  void connectLine2() {
    //float dist = dist(x, y, x, height/2);
    float dist = dist(x, y, random(width), random(height));
    
    if (dist > 150){
      float alpha = map(dist, 150, 500, 10, 0);
      //float alpha = map(dist, 150, 500, 1, 0);
      stroke(0, alpha);
      strokeWeight(0.01);
      
      //***** img1.2&1.3_vertical: straight pattern
      //line(x, y+random(-10, 10), x, height/2);
      
      //***** img1.4_vertical: symmetrical pattern with randomness
      //line(x+random(-80, 80), y+random(-10, 10), x, random(height));
      
      //***** img1.5_semi-transparent lines as bgc
      line(x+random(-80, 80), y+random(-10, 10), random(x), random(y));
    }
  }
}
