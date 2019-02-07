ArrayList<PVector> points = new ArrayList<PVector>();

color[] c = {
  color(0, 91, 197), 
  color(0, 180, 252), 
  color(23, 249, 255), 
  color(223, 147, 0), 
  color(248, 190, 0)
};

float vector_scale = 0.01;
float time = 0;

void setup() {
  size(800, 800);
  strokeWeight(0.66);
  background(0, 5, 25);
  noFill();
  smooth(8);

  for (float x=-3; x<=3; x+=0.07) {
    for (float y=-3; y<=3; y+=0.07) {
      PVector v = new PVector(x+randomGaussian()*0.003, y+randomGaussian()*0.003);
      //PVector v = new PVector(random(width), random(height));
      points.add(v);
    }
  }
}

void draw() {
  int count = 0;
  for (PVector p : points) {
    float xx = map(p.x, -6.5, 6.5, 0, width);
    float yy = map(p.y, -6.5, 6.5, 0, height);

    int cn = (int)(100*c.length*noise(count))%c.length;
    stroke(c[cn], 15);
    point(xx, yy);

    //*****img3.1
    float n = TWO_PI * noise(p.x, p.y)*300;
    PVector v = new PVector(cos(n), sin(n));

    //*****img3.2
    //float n = 500 * map( noise(p.x/5, p.y/5), 0, 1, -1, 1);
    //PVector v = new PVector(cos(n), sin(n));

    //*****img3.3
    //float n = 500 * map( noise(p.x/5, p.y/5), 0, 1, -1, 1);
    //PVector v = new PVector(cos(n)+sin(n), sin(n)*cos(n));

    p.x += vector_scale * v.x;
    p.y += vector_scale * v.y;

    count++;
  }
  time += 0.001;
}
