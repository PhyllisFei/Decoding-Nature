float angle = radians(45);
float radius = 15;

void setup() {
  size(640, 480);
  background(255);
}

void draw() {
  translate(width/2, height/2);
  float x = radius * cos(angle);
  float y = radius * sin(angle);
  //line(0, 0, x, y);
  fill(0);
  ellipse(x, y, 15, 15);
  angle += .01;
  radius += .05;
}
