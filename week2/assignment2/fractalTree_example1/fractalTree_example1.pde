void setup() {
  stroke(255);
  size(800, 640, P2D);
}

void draw() {
  float len = 180;
  float angl = 3;

  background(0);
  translate (width/2, height);  
  branch(len, angl);
}

void branch(float len, float angl) {
  float a = map(mouseY/5*4, 0, height, 0.1, 0.75);
  angl = map(mouseX/2, 0, width, 1, 13);

  if (len > 3) {
    //root
    line(0, 0, 0, -len);

    translate (0, -len);

    //right branch
    pushMatrix();
    rotate(PI / angl);
    branch(len * a, angl);
    popMatrix();

    //left branch
    pushMatrix(); 
    rotate(PI / - angl);   
    branch(len * a, angl);    
    popMatrix();
  }
}
