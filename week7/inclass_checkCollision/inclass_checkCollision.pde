PVector loc1;
PVector loc2;
float diameter = 50;

void setup() {
  size(640, 480);
  loc1 = new PVector(width/2, height/2);
  loc2 = new PVector(width/2, height/2);
}

void draw() {
  loc2.set(mouseX, mouseY, 0);
  background(255);
  
  PVector dist = PVector.sub(loc1, loc2);
  float d = dist.mag();
  
  if (d<diameter) {
    fill(255, 0, 0);
  }
  
  ellipse(loc1.x, loc1.y, diameter, diameter);
  fill(255);
  ellipse(loc2.x, loc2.y, diameter, diameter);
}
