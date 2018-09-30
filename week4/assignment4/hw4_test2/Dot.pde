class Dot {
  int w;
  int xSpacing = 10;

  PVector origin;
  float angle = 0;
  float amp;
  float period;
  float dx;
  float[] yValues;

  float mass = 3;

  Dot(PVector o, int _w, float _amp, float _period) {
    origin = o.copy();
    w = _w;
    amp = _amp;  //= random(100, 300);
    period = _period; // = random(10, 100);

    dx = (TWO_PI / period) * xSpacing;
    yValues = new float[w/xSpacing*10];
  }

  void update() {
    angle += 0.02;

    amp = random(100, 300);
    period = random(10, 100);
    //for (int i=0; i<dots.size(); i++) {
    for (int i=0; i<dots.yValues.length; i++) {
      angle += dx;
      yValues[i] = sin(angle)*amp*.1;   //regular sin wave
      //yValues[i] = sin(angle+dx)*amp*.1 + random(noise(frameCount+1000)*amp);  //sin wave with noise
    }
  }

  void display() {
    //for (int x=0; x<dots.size(); x++) {
    for (int angle = 0; angle < yValues.length; angle++) {
      fill(0);
      ellipseMode(CENTER);
      ellipse(origin.x + angle*xSpacing, origin.y + yValues[angle], mass, mass);
    }
  }

  void connectLine() {
    float dist = dist(origin.x, origin.y, origin.x, height/2);

    if (dist > 30) {
      float alpha = map(dist, 0, 50, 100, 0);
      stroke(0, alpha);
      strokeWeight(0.01);
      line(origin.x, origin.y+random(-10, 10), origin.x, height/2);
    }
  }
}
