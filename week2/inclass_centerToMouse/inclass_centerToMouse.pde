PVector mouse, center;

void setup() {
  size(640, 480);
  center = new PVector(width/2, height/2);
}

void draw() {
  background(255);

  mouse = new PVector(mouseX, mouseY);
  mouse.sub(center);   //PVector dir = PVector.sub(mouse, center);
  mouse.setMag(50);
  /* or:
        mouse.normalize();
        mouse.mult(50);
  */

  translate(center.x, center.y);
  line(0, 0, mouse.x, mouse.y);
}
