class Dot {
  int w;
  int xSpacing = 2;

  PVector origin;
  float angle = 0;
  float amp;
  float freq = .0001;
  //float period;
  //float dx;
  float[] yValues;

  float y;
  float mass=2;

  Dot(PVector o, int _w, float _amp, float _freq) {
    origin = o.get();
    w = _w;
    amp = _amp;
    freq = _freq;
    //period = _period;
    //dx = (TWO_PI / period) * xSpacing;
    yValues = new float[w/xSpacing];
  }

  void update() {
    angle += freq;

    //for (int i=0; i<dots.size(); i++) {
    for (int i=0; i<dots.yValues.length; i++) {
      //angle += dx;
      angle += freq;
      yValues[i] = sin(angle)*amp;
    }
  }
  void display() {
    //for (int x=0; x<dots.size(); x++) {
    for (int angle = 0; angle < yValues.length; angle++) {
      fill(0);
      ellipseMode(CENTER);
      ellipse(origin.x + angle*xSpacing, origin.y+yValues[angle], mass, mass);
    }
  }
}
