ArrayList<Dot> dots = new ArrayList<Dot>();
Attractor a;

float angle;
float r;

void setup() {
  size(1280, 960);
  background(0);
  frameRate(5);

  for (int i=0; i<500; i++) {
    dots.add(new Dot(width/2, height/2, 5));
  }

  a = new Attractor (width/2, height/2, 60);
}

void draw() {
  a.display();

  for (Dot d : dots) {

    for (Dot otherd : dots) {
      if (d != otherd) {
        //d.attract(otherd);
      }
    }
    d.applyForce(a.attractionForce(d));
    d.update();
    //d.checkEdges();
    d.display();
  }
}
