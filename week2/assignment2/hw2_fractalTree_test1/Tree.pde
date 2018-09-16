class Tree {
  PVector pos, vel, acc;
  PVector Ppos;

  Tree() {
    pos = new PVector(0, 0);
    Ppos = new PVector(0, 0);
  }

  void root() {
    //PVector root = new PVector(0, -len);
    //line(pos.x, pos.y, root.x, root.y);
  }

  void branch(float len, float angle) {
    Ppos.x = pos.x;
    Ppos.y = pos.y;
    
    line(0, 0, 0, -len);

    if (mousePressed && len > 5) {
      len *= 0.6;
      angle = 5;
      Ppos = pos.copy();

      //RightBranch
      pushMatrix();
      rotate(PI/angle);
      line(0, 0, 0, -len);
      popMatrix();

      //LeftBranch
      translate(Ppos.x, Ppos.y);
      pushMatrix();
      rotate(-PI/angle);
      line(0, 0, 0, -len);
      popMatrix();
      println(len);
    }
  }
}
