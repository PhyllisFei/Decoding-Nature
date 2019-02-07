Flow[] flows = new Flow[20000];
int flowsCount = 2000;

ArrayList<Dot> dots = new ArrayList<Dot>();
Attractor a;

boolean begin = false;

color[] clr1 = {
  color(0, 91, 197), //dark blue
  //color(0, 180, 252), //mid blue
  color(23, 249, 255), //green blue
  //color(87, 133, 225), // purple blue
  color(25, 124, 255), //darker blue
  //color(39, 149, 232), // blue
  color(79, 196, 255), // light blue
};

color[] clr2 = {
  color(255, 199, 137), //light orange yellow
  color(244, 129, 79), //mid orange yellow
  color(255, 85, 2), //orange yellow
  color(232, 54, 1), //red
  color(225, 66, 43), //lighter red
};

void setup() {
  size(1280, 800, P2D);
  background(0, 5);
  smooth();
  
  //add waves
  for (int i=0; i<flows.length; i++) {
    flows[i] = new Flow();
  }
  
  //add sun
  for (int i = 0; i<800; i++) {
    dots.add ( new Dot( random(-15, 0), random(height/3, height/3+10), random(1, 5) ) );
  }
  
  //initialize attractor
  a = new Attractor(0, 0, 15);
  begin = false;
}

void draw() {
  //draw waves
  for (int i=0; i<flowsCount; i++) {
    flows[i].update();
  }
 
  //draw sun with mouse interaction
  a.pos.x = mouseX;
  a.pos.y = mouseY;
  a.display();  

  //if (!begin) {
    
  //}else{
    noStroke();
    rect(0, 0, width, height); ///4*3);
    fill(0, 10);

    //pushMatrix();
    //pushStyle();
    for (int i=0; i<dots.size(); i++) {
      Dot d = dots.get(i);

      PVector force = a.attractionForce(d);
      d.applyForce(force);

      d.update();
      d.applyRestitution(-0.03);
      d.display();
    }
    //popStyle();
    //popMatrix();
  //}
}

void mouseMoved() {
  begin = true;
}
