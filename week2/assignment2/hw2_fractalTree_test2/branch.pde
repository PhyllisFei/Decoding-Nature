class Tree {
  PVector pos;
  PVector Ppos, Cpos;
  PVector vel;
  int stage;
  
  Tree() {
    pos = new PVector(width/2, height);
    vel = new PVector(0, -1);
    
    //stage = 0;
  }

  void update() {
    //PVector dir = pos.sub(Ppos);
    Ppos = pos.copy();
    pos.add(vel);

    if (frameCount == 180) {
      vel = new PVector(0, 0);
      //stage = 1;
    }
    if (frameCount>180 && frameCount<360){
      vel = new PVector();
    }
  }

  void display() {
    ellipse(pos.x, pos.y, 15, 15);
    //line(Ppos.x, Ppos.y, pos.x, pos.y);
  }
}
