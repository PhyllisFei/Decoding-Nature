class Walker {
  float x, y;
  float prevX, prevY;
  float dia;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void step() {
    float r = random(1);
    dia = random(1, 18);
    
    prevX = x;
    prevY = y;

    if (r<.5) {
      x += (mouseX - x)*.1;
      y += (mouseY - y)*.1;
    } else {
      x += random(-2, 2);
      y += random(-2, 2);
    }
  }

  void display() {
    if (mouseX < width/3) {
      fill(90, 129, 141);
    } else if (mouseX < 2*width/3 && mouseX > width/3) {
      fill(160, 190, 210);
    } else {
      fill(200, 220, 255);
    }
    ellipse(x, y, dia, dia);
  }
}
