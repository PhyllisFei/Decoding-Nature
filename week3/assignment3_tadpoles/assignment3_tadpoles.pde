ArrayList<Tadpole> tadpoles = new ArrayList<Tadpole>();
Attractor a;

void setup() {
  size(800, 640);

  for (int i = 0; i<550; i++) {
    tadpoles.add ( new Tadpole( random(0, width), random(0, height), 6 ) );
  } 
  a = new Attractor(0, 0, 15);
}

void draw() {
  fill(255, 90);
  //fill(185, 224, 249, 90);
  rect(0, 0, width, height);
  
  a.pos.x = mouseX;
  a.pos.y = mouseY;
  a.display();

  for (int i=0; i<tadpoles.size(); i++) {
    Tadpole t = tadpoles.get(i);

    PVector force = a.attractionForce(t);
    t.applyForce(force);

    t.update();
    t.applyRestitution(-0.01);
    t.checkEdges();
    t.display();
  }
}
