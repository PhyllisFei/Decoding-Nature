import java.util.Calendar;

ArrayList<PVector> points = new ArrayList<PVector>();

color[] c = {
  color(0, 91, 197), 
  color(0, 180, 252), 
  color(23, 249, 255), 
  color(223, 147, 0), 
  color(248, 190, 0)
};

float time = 0;

void setup() {
  size(640, 480);
  strokeWeight(0.66);
  background(0, 5, 25);
  noFill();
  smooth(8);

  for (float x=-300; x<=300; x+=7) {
    for (float y=-300; y<=300; y+=7) {
      //PVector v = new PVector(x+randomGaussian()*.3, y+randomGaussian()*.3);
      //PVector v = new PVector(random(x*randomGaussian()*.3), random(y*randomGaussian()*.3));
      PVector v = new PVector(random(width), random(height));
      points.add(v);
    }
  }
}

void draw() {
  int count = 0;
  for (PVector p : points) {
    float xx = map(p.x, -650, 650, 0, width);
    float yy = map(p.y, -650, 650, 0, height);

    int c_ = (int)(100 * c.length * noise(count)) % c.length;
    //int cn = (int)(c.length * noise(count)) % c.length;
    stroke(c[c_], 15);
    point(xx, yy);
    //point(p.x, p.y);

    float n = TWO_PI * noise(p.x, p.y);
    PVector v = new PVector(cos(n), sin(n));

    p.x += v.x * 5;
    p.y += v.y * 5;
    //p.x += v.x;
    //p.y += v.y;

    count++;
  }
  time += 0.001;
}

void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png");
}

String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
