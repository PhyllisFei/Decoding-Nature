Mover bob;
Spring spring;

void setup(){
  size(640, 480);
  bob = new Mover(30, width/2, 100);
  spring = new Spring(width/2, 0, 100);
}

void draw(){
  background(255);
  spring.update(bob);
  spring.display(bob);
  PVector g = new PVector(0, 2);
  bob.applyForce(g);
  bob.update();
  bob.display();
}
