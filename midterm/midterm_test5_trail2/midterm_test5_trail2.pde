import java.util.Calendar;

color[] clr = {
  color(138, 140, 247), 
  color(87, 133, 225), 
  color(167, 226, 252), 
  color(151, 229, 218), 
  color(175, 252, 203)
};

Attractor a;
ArrayList<Dot> dots = new ArrayList<Dot>();

void setup() {
  size(960, 640);
  background(255);
  //background(0);

  a = new Attractor (width/2, height/2, 100);

  for (int i=0; i<200; i++) {
    //dots.add(new Dot(random(width), random(height), 3));
    dots.add(new Dot(width, random(height), random(3,8)));
  }
}

void draw() {
  a.display();

  for (int i=0; i<dots.size(); i++) {
    Dot d = dots.get(i);

    for (int j=0; j<dots.size(); j++) {
      if (i != j) {
        Dot otherDot = dots.get(j);
        d.repel(otherDot.pos);
      }
    }
    
    d.applyForce(a.attractionForce(d));
    d.applyRestitution(-1);
    d.update();
    d.display();
  }
}

void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
