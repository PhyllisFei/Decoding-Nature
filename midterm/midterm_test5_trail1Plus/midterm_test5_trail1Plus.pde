final static color[] cols = {
  //#2C2946, #482F53, #632F5A, #753560, #913B53 //pink
  //#F9D6DC, #F3B3B0, #E98984, #ED7670, #F83B31 //red
  #B2DADA, #12222F, #2D4A6A, #84D7DF, #34819B //blue
  //#95171D, #F43F48, #FA97D6, #F6B6C8, #F8D1DC //red, pink
  //#163C31, #9DA166, #849142, #10230F, #99B425 //green
};


//import java.util.Calendar;
import processing.pdf.*;

ArrayList<Dot> dots = new ArrayList<Dot>();
Attractor a;

void setup() {
  size(1280, 960);
  beginRecord(PDF, "filename.pdf"); 
  background(0);

  a = new Attractor (width/2, height/2, 40); //80
  for (int i=0; i<150; i++) {
    dots.add(new Dot(random(width), random(height), 3));
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
        //d.connectLine1(otherDot);
        //d.connectLine2();
      }
    }

    d.applyForce(a.attractionForce(d));
    d.applyRestitution(-1.2); // -1 —>-.99
    d.update();
    d.display();
  }
}

//void keyReleased() {
//  if (key=='s' || key=='S') saveFrame(timestamp()+".png");
//}
//String timestamp() {
//  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
//}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
