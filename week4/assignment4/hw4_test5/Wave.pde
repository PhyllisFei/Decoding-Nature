class Wave {
  int xspacing = 2;
  int w;

  PVector origin;
  float angle = 0;
  float amp;
  float period;
  float dx;
  Dot[] dots;

  Wave(PVector o, int w_, float a, float p) {
    origin = o.copy();
    w = w_;
    period = p;
    amp = a;
    dx = (TWO_PI / period) * xspacing;
    dots = new Dot[w/xspacing];
    //dots = new Dot[(w+100)/xspacing];
    for (int i = 0; i < dots.length; i++) {
      dots[i] = new Dot();
    }
  }

  void calculate() {
    angle += 0.2;
    float x = angle;
    
    float r = noise(3);

    for (int i = 0; i < dots.length; i++) {
      //float x = angle;

      //***** basic wave
      //dots[i].setposition(origin.x+i*xspacing, origin.y+sin(x)*amp);

      //***** 
      //dots[i].setposition( origin.x+i*xspacing, origin.y + cos(x)*amp + random(-10, 10) );

      //***** basic wave with noise
      float y =  origin.y + ((noise(i*.01*(r*(noise(frameCount*.01)))+frameCount*.1)- .5)*300) + sin(x)*(amp+cos(x*0.05)+30) + random(-20, 20);
      y += (sin(x*2))*70;
      dots[i].setposition( origin.x+i*xspacing, y );

      //***** basic wave with more noise
      //dots[i].setposition( origin.x+i*xspacing, origin.y + sin(random(x-10, x+10))*amp + random (-10, 10) );

      x+=dx;
      r+=0.01;
    }
  }

  void display() {   
    for (int i = 0; i < dots.length; i++) {
      float c = random(0, 1);
      dots[i].display();
      if (c<0.65) {
        dots[i].connectLines1();
        
      }
      for (int j = 0; j < dots.length; j++) {
        //Dot otherDot = dots[j] = new Dot();
        Dot otherDot = dots[j];

        if (i!= j && c<0.2) {
          //dots[i].connectLines1();
          dots[i].connectLines2(otherDot);
        }
      }
    }
  }
}
