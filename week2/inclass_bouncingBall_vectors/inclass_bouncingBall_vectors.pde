Mover ball;

void setup() {
  size(640, 480);
  ball = new Mover();
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  PVector perlinNoise = new PVector( noise(frameCount*.01), noise(frameCount*.01) );
  
  ball.update(perlinNoise);
  ball.checkEdges();
  ball.display();
}


/******* normal version *******
int x, y;
int speedX, speedY;

void setup() {
  size(640, 480);

  x = width/2;
  y = height/2;
  speedX = 2;
  speedY = 5;
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  ellipse(x, y, 30, 30);
  x += speedX;
  y += speedY;

  if (x>width || x<0) {
    speedX *= -1;
  }
  if (y>height || y<0) {
    speedY *= -1;
  }
}
*******/
