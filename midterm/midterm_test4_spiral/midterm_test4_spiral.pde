import java.util.Calendar;

//Attractor a;
ArrayList<Dot> dots = new ArrayList<Dot>();


void setup() {
  size(960, 640);
  background(255);
  //frameRate(1000);

  //a = new Attractor (width/2, height/2, 60);

  for (int i=0; i<10; i++) {
    dots.add(new Dot(0, 0, 3));
  }
}

void draw() {
  //a.update();
  //a.display();
  translate(width/2, height/2);
  
  for (int i=0; i<dots.size(); i++) {
    Dot d = dots.get(i);

    //d.applyForce(a.attractionForce(d));
    d.update();
    d.display();

    for (int j=0; j<dots.size(); j++) {
      Dot otherDot = dots.get(j);
      if (i != j) {
        //d.connectLine1(otherDot);
      }
    }
  }
}

void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
