class Dot {
  PVector pos;

  Dot() {
    pos = new PVector();
  }

  void setposition(float x, float y) {
    pos.x = x;
    pos.y = y;
  }

  void display() {
    //ellipse(pos.x, pos.y, 5, 1);
  }

  void connectLines1() {
    float dist = dist(pos.x, pos.y, pos.x, height/2);

    if (dist < 300) {
      float alpha = map(dist, 0, 255, 180, 80);
      //stroke(72, 93, 54, alpha); //dark green
      //stroke(2, 93, 54, alpha); //mid dark green


      float r = map(dist, 0, 500, 0, 30);
      float g = map(dist, 500, 0, 200, 100);
      float b = map(dist, 0, 250, 250, 0);
      fill(r, g, b, alpha); //fill(r, g, b, 120);

      stroke(133, 216, 185, alpha);  //stroke(r, g, b, alpha);
      strokeWeight(5);

      //*****img2.1
      //rect(pos.x, pos.y+random(-5, 15), pos.x*.5, pos.y*.5);

      //*****img2.2
      //rect(pos.x, 2*pos.y+random(-5, 15), pos.x*.5, pos.y*.5);

      //*****img2.3
      //rect(pos.x, pos.y+random(-25, 35), pos.x*.5, pos.y*.5);
      //rect(2*pos.y+random(-155, 50), pos.x, pos.x*.5, pos.y*.5);
      
      //*****img.2.4???
      //rect(pos.x, pos.y+random(-15, 10), pos.x*.5*randomGaussian(), pos.y*.5);
      //rect(2*pos.y+random(-55, 20), pos.x, pos.x*.5, pos.y*.5);
      
      //*****img.2.5
      rect(pos.x*100, pos.y+random(-25, 35), pos.x*randomGaussian(), pos.y*.5);
      rect(2*pos.y+randomGaussian()*random(-155, 50), pos.x, pos.x*.5, pos.y*.5);
    }
  }

  void connectLines2(Dot other) {
    float dist = dist(pos.x, pos.y, other.pos.x, other.pos.y);
    if (dist < 100 && dist > 55) {
      float alpha = map(dist, 0, 45, 255, 95);
      stroke(0, alpha+2);
      strokeWeight(1);
      line(pos.x, pos.y, random(other.pos.x-15, other.pos.x-10), other.pos.y );
    }
  }
}
