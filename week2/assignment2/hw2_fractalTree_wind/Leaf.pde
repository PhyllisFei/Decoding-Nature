class Leaf {
  PVector pos;
  float xSpd, ySpd;
  //PVector vel;
  //PVector acc;

  Leaf(PVector l) {
    pos = l.copy();
    xSpd = random(-.1, 1);
    ySpd = random(1, 3);
    //vel = PVector.random2D();
    //vel.mult(5);
    //acc = new PVector( random(-.01008, .00008), random(.05, .1) );
  }

  void update() {
    pos.x += xSpd;
    pos.y += ySpd;
    //acc = _acc;
    //pos.add(vel);
    //vel.add(acc);
    //vel.limit(2);
    //float freq = 0.55;
    //int amp = 15;
    //xSpd = random(noise(frameCount*freq + 100) * amp - amp/2);
    //ySpd = random(noise(frameCount*freq) * amp );
  }

  void display() {
    noStroke();
    fill(76, 159, 102, 150);
    //fill(221, 182, 204, 150);
    ellipse(pos.x, pos.y, 7, 12);
  }
}
