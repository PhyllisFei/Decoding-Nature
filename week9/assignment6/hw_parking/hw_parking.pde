boolean debug = false;

Path path1;
Path path2;

Vehicle car1;
Vehicle car2;
boolean pause=false;

void setup() {
  size(640, 360);
  newPath();

  car1 = new Vehicle(new PVector(-20, 20), 2, 0.25);
  car2 = new Vehicle(new PVector(-150, height-20), 1.6, 0.33);
}

void draw() {
  background(255);
  fill(0);
  rect(width-30, height-120, 100, 5);
  rect(width-30, height-85, 100, 5);
  rect(width-30, height-50, 100, 5);
  
  pushMatrix();
  pushStyle();
  stroke(0, 150, 0);
  strokeWeight(4);
  line(width-2, height-118, width-2, height-50);
  popMatrix();
  popStyle();
  
  pushMatrix();
  pushStyle();
  stroke(150);
  strokeWeight(3);
  line(0, 2, width/4+2, 2);
  line(-20, 2+40, width/4+2-55, 2+40);
  line(width/4+2, 2, width/4+2, height/3-20);
  line(width/4+2-55, 2+40, width/4+2-55, height/3-20+40);
  line(width/4+2, height/3-20, width/5*3+40, height/3-20);
  line(width/4+2-55, height/3-20+40, width/5*3+40-55, height/3-20+40);
  line(width/5*3+40, height/3-20, width/5*3+40, height-120);
  line(width/5*3+40-55, height/3-20+40, width/5*3+40-55, height-143);
  line(width/5*3+40, height-83-37, width-29, height-83-37);
  //line(width/5*3+40, height-83, width, height-83);

  line(0, height-2-40, width/5+20-40, height-2-40);
  line(0, height-2, width/5+20, height-2);
  line(width/5+20-40, height-2-40, width/5+20-40, height-83-60);
  line(width/5+20, height-2, width/5+20, height-83);
  line(width/5+20-40, height-83-60, width/5*3-15, height-83-60);
  line(width/5+20, height-83, width/5*3-15, height-83);
  line(width/5*3-15, height-83, width/5*3-15, height-83+37);
  line(width/5*3-15, height-83+37, width-29, height-83+37);

  popStyle();
  popMatrix();

  //path1.display();
  //path2.display();

  car1.follow(path1);
  car2.follow(path2);

  car1.run();
  car2.run();


  //car1.borders(path);
  //car2.borders(path);

  PVector destination1 = new PVector(width-10, height-65);
  car1.arrive(destination1);

  PVector destination2 = new PVector(width-10, height-100);
  car2.arrive(destination2);
  //ellipse(width-10, height-60, 10, 10);
  //ellipse(width-10, height-100, 10, 10);
}


void keyPressed() {
  if (key==' ') {
    pause=!pause;
  }
}


void newPath() {
  path1 = new Path();
  path1.addPoint(-20, 20);
  path1.addPoint(width/5, 20);
  path1.addPoint(width/5+.1, height/3);
  path1.addPoint(width/5*3, height/3);
  path1.addPoint(width/3*2, height-65);
  path1.addPoint(width, height-65);


  path2 = new Path();
  path2.addPoint(-20, height-20);
  path2.addPoint(width/5, height-20);
  path2.addPoint(width/5+.1, height/3*2);
  path2.addPoint(width/5*3, height/3*2);
  path2.addPoint(width/3*2, height-100);
  path2.addPoint(width, height-100);
}
