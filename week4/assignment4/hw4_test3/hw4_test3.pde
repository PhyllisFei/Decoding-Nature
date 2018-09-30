//ArrayList<Dot> dots = new ArrayList<Dot>();
Dot dots;

void setup() {
  size(640, 480);

  //for (int i=0; i<200; i++) {
  //  dots.add(new Dot(new PVector (random(0,width), height/2), width, 200, 100 ));
  //}

  dots = new Dot( new PVector ( 0, height/2), width, 200, 100 );
}

void draw() {
  background(255);

  //for (int i=0; i<dots.size(); i++) {
  //  Dot d = dots.get(i);
  //d.update();
  //d.display();
  //}

  dots.update();
  dots.display();
}
