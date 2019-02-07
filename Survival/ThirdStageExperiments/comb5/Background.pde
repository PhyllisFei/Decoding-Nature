float yoff1 = 0.0;
float yoff2 = 0.0;
float x, y1, y2;

void drawbg() {
  float xoff = 0;
  noStroke();

  // ***** sun area ***** //
  pushMatrix();
  pushStyle();
  fill(0, 50);
  //fill(100, 20);
  beginShape(); 
  for ( x = 0; x <= width; x += 10) {
    y1 = map(noise(xoff, yoff1), 0, 1, 600, height);
    vertex(x, y1); 
    xoff += .03; //0.01;
  }
  yoff1 += .02; //0.004;
  vertex(width, 0);
  vertex(0, 0);
  endShape(CLOSE);
  popStyle();

  //// ***** wave area ***** //
  pushStyle();
  fill(0, 20);
  //fill(255, 0, 0, 20);
  beginShape(); 
  for ( x = 0; x <= width; x += 10) {
    y2 = map(noise(xoff, yoff2), 0, 1, 400, height);
    vertex(x, y2); 
    xoff += 0.01;
  }
  yoff2 += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popStyle();
  popMatrix();
}
