float angle = 0;
float vel = 0;
float acc = 0.00001;

void setup() {
  size(640, 480);
}

void draw() {
  background(255);
  fill(0);
  translate(width/2, height/2);
  rotate(angle);
  line(-50, 0, 50, 0);
  ellipse(-50, 0, 20, 20);
  ellipse(50, 0, 20, 20);
  vel += acc;
  angle += vel;
  acc --;
}
