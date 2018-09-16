Tree t;
//int[] stage;

void setup() {
  size(800, 640);
  background(0);
  t = new Tree();
}

void draw() {
  fill(255);
  noStroke();

  //for (int i=0; i<stage.length; i++) {
  t.update();
  t.display();
  //}
}
