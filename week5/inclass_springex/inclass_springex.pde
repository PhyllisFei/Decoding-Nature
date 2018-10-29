Ball ball1, ball2, ball3;
Spring spring1, spring2, spring3;


void setup() {
  size(640, 480);
  ball1 = new Ball(random(height), random(width), 100);
  ball2 = new Ball(random(height), random(width), 100);
  ball3 = new Ball(random(height), random(width), 100);
  spring1 = new Spring(random(width), random(height), 100);
  spring2 = new Spring(random(width), random(height), 100);
  spring3 = new Spring(random(width), random(height), 100);
}

void draw() {
  background(255, 100);
  spring1.update(ball1);
  spring1.display(ball1);
  
  spring2.update(ball2);
  spring2.display(ball2);
  
  spring3.update(ball2);
  spring3.display(ball2);
  
  PVector g = new PVector(0, 2);
  ball1.applyForce(g);
  ball1.update();
  ball1.display();
  
  ball2.applyForce(g);
  ball2.update();
  ball2.display();
  
  ball3.applyForce(g);
  ball3.update();
  ball3.display();
}
