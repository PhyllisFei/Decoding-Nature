Ball b;

void setup() {
  size(500, 600);
  background(0);
  frameRate(20);
  b = new Ball();
}

void draw() {
  b.move();
  b.update();
  b.display();
}
