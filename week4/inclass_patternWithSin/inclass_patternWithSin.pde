float angle = 0;
float increment = TWO_PI/23;

void setup() {
  size(640, 480);
}
void draw() {
  background(255);
  noFill();
  stroke(0, 100);
  angle = 0;
  translate(width/2, height/2);
  for (int i = 0; i<23; i++) {
    rotate(angle*i);
    ellipse(0, 0, sin(frameCount*.001*i)*100 * sin(frameCount*.003), 200);
    angle += .1;
  }
}
