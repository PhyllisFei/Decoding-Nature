Mover m;
Attractor a;

void setup() {
  size(1280, 720);
  m = new Mover(random (0, width), random(0, height), random(10, 40));
  a = new Attractor (width/2, height/2, 60);
}

void draw() {
  background(255);
  a.pos.x = mouseX;
  a.pos.y = mouseY;
  a.display();
  
  m.applyForce( a.attractionForce(m) );
  m.update();
  m.checkEdges();
  m.display();
}
