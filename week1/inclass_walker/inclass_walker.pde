Walker w;

void setup() {
  size(640, 480);
  w = new Walker();
  println(w.x);
}

void draw() {
  w.step();
  w.display();
}

//**************//

class Walker {
  float x, y;

  //constructor
  Walker() {
    x = width/2;
    y = height/2;
  }

  //logic to make the walker move
  void step() {
    float r = random(1);
    if (r<.2) {
      x--;
    } else if (r<.4) {
      y--;
    } else if (r<.6) {
      y++;
    } else {
      x++;
    }
    //x += random(-1, 6);
    //y += random(-1, 1);
  }

  void display() {
    point(x, y);
  }
}
