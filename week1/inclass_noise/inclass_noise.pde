float xOff = 0;
float yOff = 0;

void setup() {
  size(640, 640);
}

void draw() {
  background(0);
  float x = width * noise(xOff);
  float y = height * noise(yOff);
  
  xOff += .01;
  yOff += .005;

  ellipse(x, y, 30, 30);
}
