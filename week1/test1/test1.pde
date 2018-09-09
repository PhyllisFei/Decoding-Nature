float x, y;
float xSpeed, ySpeed;

void setup(){
  size(500, 600);
  background(0);
  
  xSpeed = 2;
  ySpeed = 2;
}

void draw(){
  x=x+xSpeed;
  y=y+ySpeed;
  
  if ( x>width/2 || x<0 ) {
  xSpeed = -xSpeed;
  }
  if ( y>height/2 || y<0 ) {
  ySpeed = -ySpeed;
  }
  
  noStroke();
  translate(width/2, height/2);
  ellipse(x, y, 5, 5);
}
