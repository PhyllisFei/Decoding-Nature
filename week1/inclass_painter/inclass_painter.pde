float r = randomGaussian();

void setup() {
  size(640, 360);
  r *= 50;
  //r += width/2;
}

void draw() {
  //
}

void mouseMoved() {
  //float x = mouseX + r*10;
  //float y = mouseY + r*10;
 
  noStroke();
  fill(random(255), random(255), random(255));
  ellipse(random(mouseX-15, mouseX+15), random(mouseY-15, mouseY+15), r, r);
  //ellipse(x, y, r, r);
}
