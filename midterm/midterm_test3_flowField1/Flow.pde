class Flow{
  PVector pos, posP;
  float stepSize, angle;
  boolean isOutside = false;

  Flow() {
    pos = new PVector(random(width), random(height));
    posP = new PVector(pos.x, pos.y);
    stepSize = random(1, 5);
  }

  void update() {
    float a = 50;
    
    //img3.1
    //angle = noise(pos.x/a, pos.y/a);
    
    //img3.2
    angle = noise(pos.x/a, pos.y/a) * 100;

    //img3.3
    //pos.x += cos(angle) * stepSize * randomGaussian() *.1;
    
    pos.x += cos(angle) * stepSize;
    pos.y += sin(angle) * stepSize;

    if (pos.x<-10) isOutside = true;
    else if (pos.x>width+10) isOutside = true;
    else if (pos.y<-10) isOutside = true;
    else if (pos.y>height+10) isOutside = true;

    if (isOutside) {
      pos.x = random(width);
      pos.y = random(height);
      posP.set(pos);
    }

    int c = (int) (clr.length*100*noise(stepSize) % clr.length);
    
    stroke(clr[c], 50);
    strokeWeight(stepSize);
    line(posP.x, posP.y, pos.x, pos.y);

    posP.set(pos);

    isOutside = false;
  }
}
