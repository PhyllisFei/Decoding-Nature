void setup() {
  size(640, 360);
}

void draw() {
  float r = randomGaussian();
  r *= 50;
  r += width/2;
  noStroke();
  fill(50, 30);
  ellipse(r, height/2, 20, 20);
}
