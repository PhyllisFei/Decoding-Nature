Tree t;
float len, angle;

void setup() {
  size(640, 480);
  background(0);
  stroke(255);

  len = 180;
  t = new Tree();
}

void draw() {
  translate(width/2, height);

  t.root();
  t.branch(len, angle);
}
