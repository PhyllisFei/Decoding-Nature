float yBound = 600;
float yOffset1, yOffset2;
float yoff1 = 0.0;
float yoff2 = 0.0;
float x, y1, y2;

void drawbg() {
  //background(0);
  float xoff = 0;
  noStroke();
  
  // ***** sun area ***** //
  pushMatrix();
  pushStyle();
  fill(0, 50);
  //fill(0, 255, 0, 20);
  beginShape(); 
  for ( x = 0; x <= width; x += 10) {
    y1 = map(noise(xoff, yoff1), 0, 1, height*.47, height);
    y1 -= yOffset1;
    vertex(x, y1); 
    xoff += .03;
  }
  yoff1 += .02;
  vertex(width, 0);
  vertex(0, 0);
  endShape(CLOSE);
  popStyle();

  // ***** wave area ***** //
  pushStyle();
  fill(0, 20);
  //fill(255, 0, 0, 20);
  beginShape(); 
  for ( x = 0; x <= width; x += 10) {
    y2 = map(noise(xoff, yoff2), 0, 1, height*.31, height);
    y2 -= yOffset2;
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
