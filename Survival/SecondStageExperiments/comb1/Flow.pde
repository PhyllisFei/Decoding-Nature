class Flow {
  PVector pos, posP;
  float stepSize, angle;
  boolean isOutside = false;
  float amp;
  float maxHeight;

  Flow() {
    pos = new PVector(0, random(height/4*3+10, height));
    posP = new PVector(pos.x, pos.y);
    stepSize = random(1, 5);
    amp = 300;
    
    //max height of water
    maxHeight = random(height/4*3+sin(frameCount*.01), height);
  }

  void update() {
    float a = 50;
    
    //make the swaves
    angle = noise(pos.x/a, pos.y/a)*sin(amp)*random(-2, 2);
    //angle = noise((pos.x/a*frameCount*.01+100)*.5, pos.y/a);
    //angle = noise(pos.x/a, (pos.y/a*frameCount*.01+100)*.5);
    pos.x += cos(angle*.001) * stepSize * 5;
    pos.y += sin(angle) * stepSize * 8;

    //constrain the position of water
    if (pos.x<-10) isOutside = true;
    else if (pos.x>width+10) isOutside = true;
    else if (pos.y<maxHeight) isOutside = true;
    else if (pos.y>height+10) isOutside = true;

    if (isOutside) {
      pos.x = random(0, width);
      pos.y = random(height/4*3, height);
      //pos.y *= sin(frameCount*.01)*10;
      //pos.y = height/5*4-random(sin(frameCount*.01)*10);
      posP.set(pos);
    }

    int c1 = (int) (clr1.length*100*noise(stepSize) % clr1.length);
    
    stroke(clr1[c1], 80);
    strokeWeight(stepSize);
    line(posP.x, posP.y, pos.x, pos.y);

    posP.set(pos);

    isOutside = false;
  }
}
