int cols, rows;
int scl = 15;
int w = 1200;
int h = 1000;

ArrayList <Dot> dots = new ArrayList<Dot>();

void setup() {
  //frameRate(20);
  size(960, 640, P3D);
  cols = w/scl;
  rows = h/scl;
  
  for (int y = 0; y < rows-1; y++) {
    for (int x = 0; x < cols; x++) {
      dots.add(new Dot(x*scl, y*scl));
    }
  }
}

void draw() {  
  background(0);
  noFill();
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);

  for (Dot d : dots) {
    d.update();
    for (Dot otherD : dots) {
      if (d!=otherD) {
        d.connectLine(otherD);
      }
    }
    d.wave();
    d.stable();
    PVector waveRange = new PVector(mouseX, mouseY);
    d.display(waveRange);
  }
}
