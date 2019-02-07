ArrayList<Dot> dots = new ArrayList<Dot>();
Attractor a;

boolean begin;

color[] clr = {
  color(255, 199, 137), //light orange yellow
  color(244, 129, 79), //mid orange yellow
  color(255, 85, 2), //orange yellow
  color(232, 54, 1), //red
  color(225, 66, 43), //lighter red
};

void setup() {
  size(960, 640);

  for (int i = 0; i<500; i++) {
    dots.add ( new Dot( random(0, width), random(0, height), random(1, 5) ) );
  }

  a = new Attractor(0, 0, 15);

  begin = false;
}

void draw() {
  //if (!begin) {
  //  background(0);
  //} else {
    fill(0, 10);
    rect(0, 0, width, height);
  //}
  

  a.pos.x = mouseX;
  a.pos.y = mouseY;
  a.display();

  pushMatrix();
  pushStyle();
  for (int i=0; i<dots.size(); i++) {
    Dot d = dots.get(i);

    PVector force = a.attractionForce(d);
    d.applyForce(force);

    d.update();
    d.applyRestitution(-0.01);
    //d.checkEdges();
    d.display();
  }
  popStyle();
  popMatrix();
}

void mouseMoved() {
  begin = true;
}
