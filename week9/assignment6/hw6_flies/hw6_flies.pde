PImage fly;
PImage poop;

boolean debug = false;
boolean pause=false;

Path path1;
Path path2;
Path path3;
Path path4;

Fly fly1;
Fly fly2;
Fly fly3;
Fly fly4;

void setup() {
  size(640, 360);
  fly = loadImage("fly.png");
  poop = loadImage("poop.png");
  fly.resize(30, 30);
  poop.resize(140, 140);
  newPath();

  fly1 = new Fly(new PVector(-20, 20), 2, 0.13);
  fly2 = new Fly(new PVector(-150, height/8), 1.8, 0.18);
  fly3 = new Fly(new PVector(width+30, 20), 2, 0.13);
  fly4 = new Fly(new PVector(width+100, height/8), 2, 0.18);
}

void draw() {
  background(0);

  image(poop, width/2-50, height/3+100);

  //path1.display();
  //path2.display();
  //path3.display();
  //path4.display();

  fly1.follow(path1);
  fly2.follow(path2);
  fly3.follow(path3);
  fly4.follow(path4);

  fly1.run();
  fly2.run();
  fly3.run();
  fly4.run();

  PVector destination1 = new PVector(width/2+10, height/7*5);
  //ellipse(width/2+10, height/7*5, 10, 10);
  fly1.arrive1(destination1);

  PVector destination2 = new PVector(width/2-30, height-10);
  //ellipse(width/2-30, height-30, 10, 10);
  fly2.arrive1(destination2);

  PVector destination3 = new PVector(width/2+30, height-100);
  //ellipse(width/2+30, height-100, 10, 10);
  fly3.arrive2(destination3);

  PVector destination4 = new PVector(width/2+80, height-50);
  //ellipse(width/2+80, height-50, 10, 10);
  fly4.arrive3(destination4);
}
void keyPressed() {
  if (key==' ') {
    pause=!pause;
  }
}

void newPath() {
  path1 = new Path();
  path1.addPoint(-20, 20);
  path1.addPoint(width/10, 20);
  path1.addPoint(width/10+.1, height/7);
  path1.addPoint(width/10*1.2, height/7);
  path1.addPoint(width/10*1.5, height/7*2);
  path1.addPoint(width/10*2, height/7*2);
  path1.addPoint(width/10*2.5, height/7*3);
  path1.addPoint(width/10*3.5, height/7*3);
  path1.addPoint(width/10*4, height/7*5-50);


  path2 = new Path();
  path2.addPoint(-20, height/4);
  path2.addPoint(width/9, height/4);
  path2.addPoint(width/9+20, height/4*1.8);
  path2.addPoint(width/9*1.8, height/4*1.8);
  path2.addPoint(width/9*2.7, height/4*2.5);
  path2.addPoint(width/9*2.7, height/4*2.8);
  path2.addPoint(width/9*3.5-10, height-80);

  path3 = new Path();
  path3.addPoint(width+50, 20);
  path3.addPoint(width-width/10-10, height/10+80);
  path3.addPoint(width-width/10-80, height/10+50);
  path3.addPoint(width-width/10-150, height/10+130);
  path3.addPoint(width-width/10-100, height/10+190);
  //path3.addPoint(width-width/10-120, height/10+230);

  path4 = new Path();
  path4.addPoint(width+100, height/3);
  path4.addPoint(width/8*7, height/3);
  path4.addPoint(width/8*7-20, height/8*2);
  path4.addPoint(width/8*7-70, height/8*2);
  path4.addPoint(width/8*7-80, height/8*3);
  path4.addPoint(width/8*7-150, height/8*3);
  path4.addPoint(width/8*7-180, height/8*4.5);
}
