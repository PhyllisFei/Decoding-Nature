float x, y;
float xSpeed, ySpeed;

void setup() {
  size(500, 600);
  background(0);
  noStroke();

  x = width/2;
  y = height/2;
  //xSpeed = 0;
  //ySpeed = 0;
}

void draw() {
  xSpeed = random(-1, 3);
  ySpeed = random(-3, 1);

  x += xSpeed;
  y += ySpeed;

  if (x>width || x<0) {
    xSpeed = -xSpeed;
  }
  if (y>height || y<0) {
    ySpeed = -ySpeed;
  }

  fill(255);
  ellipse(x, y, 5, 5);
}
