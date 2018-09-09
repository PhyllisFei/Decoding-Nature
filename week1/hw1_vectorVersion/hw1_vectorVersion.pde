Walker w;

void setup() {
  size(640, 480);
  background(255);
  w = new Walker();
}

void draw() {
  w.step();
  w.display();
}
