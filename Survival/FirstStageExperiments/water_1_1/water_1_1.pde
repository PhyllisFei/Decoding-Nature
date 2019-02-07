int cols, rows;
int scl = 15;
int w = 2000;
int h = 1500;
float flying = 0;

float [][] terrain;

void setup() {
  size(960, 640, P3D);
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
}

void draw() {  
  background(0);
  stroke(81, 115, 232);
  noFill();

  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);

  flying += 0.01;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = flying;
    //float xoff = 0;
    for (int x = 0; x < cols; x++) { 
      terrain [x][y] = map(noise(xoff, yoff), 0, 1, -50, 50);
      xoff += 0.1;
    }  
    yoff += 0.1;
  }

  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain [x][y]);
      vertex(x*scl, (y+1)*scl, terrain [x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
