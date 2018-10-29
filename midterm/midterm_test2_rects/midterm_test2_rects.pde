import java.util.Calendar;

Wave wave1;
Wave wave2;

void setup() {
  size(960, 640);
  background(0);
  frameRate(10);

  wave1 = new Wave(new PVector(0, height/2), width, 20, 300);

  //wave2 = new Wave(new PVector(random(width), height), height, 40, 220);
}

void draw() {
  fill(0, 8);

  wave1.update();
  wave1.display();
  //wave2.update();
  //wave2.display();
}
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
