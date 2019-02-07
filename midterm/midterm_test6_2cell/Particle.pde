class Particle {
  float x, y;
  float dx, dy;
  float angle, r;
  float mass;

  int id;
  float lifeSpan;
  
  color c = cols[(int)random(cols.length)];

  Particle(int i) {
    id = i;
    lifeSpan = (int)random(100, 1000);
    angle = random(TWO_PI);
    //r = 1.0*randomGaussian() + (width/2-200)*(1.0-pow(random(1.0), 7.0));
    r = 3.0*randomGaussian() + (width/2-200)*(1.0-pow(random(1.5), 100.0));
    x = cos(angle)*r;
    y = sin(angle)*r;
    mass = random(1, 15);
  }
  
  void display() {
    stroke(c, 30);
    
    //int c = (int) (clr.length*100*noise(r) % clr.length);
    //stroke(clr[c], 30);
    
    ellipse(x+width/2, y+height/2, mass, mass);
  }

  void update() {
    x += dx;
    y += dy;
    --lifeSpan;
  }
}
