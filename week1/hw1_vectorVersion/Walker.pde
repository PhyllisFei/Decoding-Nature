class Walker {
  PVector pos;
  PVector vel;
  PVector Ppos;
  float x, y;
  float prevX, prevY;

  Walker() {
    pos = new PVector(0, 0);
    vel = new PVector(-1, 1);
    Ppos = new PVector(0, 0);
    //x = width/2;
    //y = height/2; 
  }

  void step() {
    float r = random(1);
    
    Ppos=pos.copy();
   
    if (r<.3) {
      //x += mouseX - pos.x;
      //y += mouseY - pos.y;
      //x += (mouseX - x)*.1;
      //y += (mouseY - y)*.1;
      PVector mouse = new PVector(mouseX, mouseY);
      
      mouse.sub(pos);
      mouse.mult(.1);
      pos.add(mouse);

      
    } else {
      vel = PVector.random2D();
      vel.mult(2);
      pos.add(vel);
    }
  }

  void display() {
    //point(x, y);
    line(Ppos.x, Ppos.y, pos.x, pos.y);
  }
}
