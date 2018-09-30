Mover m;
Attractor a;

void setup() {
  size(640, 480);
  rectMode(CENTER);
  m = new Mover(10, width/2, height/2);
  a = new Attractor();
}

void draw() {
  background(255);
  a.position.x = mouseX;
  a.position.y = mouseY;
  
  //m.applyForce(a.attract(m));
  m.update();
  m.display();
}
