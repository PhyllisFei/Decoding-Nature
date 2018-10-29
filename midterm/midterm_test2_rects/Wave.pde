class Wave {
  int xspacing = 2;
  float w;

  PVector origin;
  float angle = 0;
  float amp;
  float period;
  float dx;
  Dot[] dots;

  Wave(PVector o, float w_, float a, float p) {
    origin = o.copy();
    w = w_;
    period = p;
    amp = a;
    dx = (TWO_PI / period) * xspacing;
    dots = new Dot[int(w/xspacing)];
    for (int i = 0; i < dots.length; i++) {
      dots[i] = new Dot();
    }
  }

  void update() {
    angle += 0.2;
    float x = angle;

    for (int i = 0; i < dots.length; i++) {
      float y =  origin.y + ((noise(i*.01*10*(noise(frameCount*.01))+frameCount*.1)- .5)*300) + sin(x)*(amp+cos(x*0.05)+30) + random(-20, 20);
      y += sin(x*2)*70;
      x+=dx;
      dots[i].setposition( origin.x+i*xspacing, y );
    }
  }

  void display() {   
    for (int i = 0; i < dots.length; i++) {
      float c = random(0, 1);
      dots[i].display();
      if (c<0.65) {
        dots[i].connectLines1();
      }
      
      //for (int j = 0; j < dots.length; j++) {
      //  //Dot otherDot = dots[j] = new Dot();
      //  Dot otherDot = dots[j];
      //  if (i!= j && c<0.2) {
      //    dots[i].connectLines2(otherDot);
      //  }
      //}
    }
  }
}
