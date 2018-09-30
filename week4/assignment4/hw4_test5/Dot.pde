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
    noStroke();
    fill(0, 200);
    ellipse(pos.x, pos.y, 1.5, 1.5);
  }

  void connectLines1() {
    float dist = dist(pos.x, pos.y, pos.x, height/2);

    if (dist < 300) {
      float alpha = map(dist, 0, 200, 180, 50);
      stroke(0, alpha);
      strokeWeight(1);
      line(pos.x, pos.y+random(-15, 15), pos.x, height/2);
    }
  }
  
  void connectLines2(Dot other) {
    float dist = dist(pos.x, pos.y, other.pos.x, other.pos.y);
    if (dist < 100 && dist > 55) {
      float alpha = map(dist, 0, 45, 255, 95);
      stroke(0, alpha+2);
      strokeWeight(1);
      line(pos.x, pos.y, random(other.pos.x-15,other.pos.x-10) , other.pos.y );
    }
  }
}
