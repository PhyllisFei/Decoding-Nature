//ArrayList<Dot> dots = new ArrayList<Dot>();
Dot dots;

void setup() {
  size(640, 480);
  frameRate(10);
  smooth();

  //for (int i=0; i<200; i++) {
  //  dots.add(new Dost(new PVector (random(0,width), height/2), width, 200, 100 ));
  //}

  dots = new Dot( new PVector ( 0, height/2), width, 100, 300 );
}

void draw() {
  background(255);
  
  pushMatrix();
  //stroke(255, 0, 0);
  //strokeWeight(1.5);
  line(0, height/2, width, height/2);
  popMatrix();
  
  //for (int i=0; i<dots.size(); i++) {
  //  Dot d = dots.get(i);
  //d.update();
  //d.display();
  //}

  dots.update();
  dots.display();

  for (int i=0; i<dots.yValues.length; i++) {
    dots.connectLine();
  }
}
