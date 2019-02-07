import java.util.Calendar;
//import processing.pdf.*;

ArrayList<Dot> dots = new ArrayList<Dot>();

float angle = 0;
float startAngle;
float amp = 150;
float freq = 0.00001;

void setup() {
  //size(1280, 960);
  size(19200, 14400);
  //beginRecord(PDF, "filename.pdf"); 

  background(255);
  //frameRate(15);
  //strokeWeight(15);
  for (int i=0; i<20; i++) {
    dots.add(new Dot(random(0, width), random(height)));
  }
}

void draw() {
  for (int i=0; i<dots.size(); i++) {
    Dot d = dots.get(i);
    d.update();
    d.display();

    for (int j=0; j<dots.size(); j++) {
      Dot otherDot = dots.get(j);
      if (i != j) {
        d.connectLine1(otherDot);
        d.connectLine2();
      }
    }
  }
}

//void keyPressed() {
//  if (key == 'q') {
//    endRecord();
//    exit();
//  }
//}

void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".tif");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
