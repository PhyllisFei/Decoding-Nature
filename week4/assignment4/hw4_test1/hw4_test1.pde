ArrayList<Dot> dots = new ArrayList<Dot>();

float angle = 0;
float startAngle;
float amp = 150;
float freq = 0.00001;

void setup() {
  size(640, 480);
  //frameRate(15);

  for (int i=0; i<200; i++) {
    dots.add(new Dot(random(0, width), height/2));
  }
}

void draw() {
  background(255);

  line(0, height/2, width, height/2);
  
  for (int i=0; i<dots.size(); i++) {
    Dot d = dots.get(i);
    d.update();
    d.display();

    for (int j=0; j<dots.size(); j++) {
      Dot otherDot = dots.get(j);
      if (i != j) {
        d.connectLine1(otherDot);
        d.connectLine2();
      }
    }
  }
}
