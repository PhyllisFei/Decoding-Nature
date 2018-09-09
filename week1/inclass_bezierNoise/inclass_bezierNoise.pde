void setup(){
 size(640,640);
}

void draw(){
  background(255);
  noFill();
  bezier(0, 0, mouseX, mouseY, mouseX, mouseY, width, height);
}
