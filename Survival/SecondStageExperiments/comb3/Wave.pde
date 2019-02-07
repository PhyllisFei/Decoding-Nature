class Wave {
  PVector pos, vel, acc;
  float size;
  float maxforce;
  float maxspeed;
  int c;
  float r;
  //float xoff, yoff;

    Wave(PVector l, float ms, float mf) {
    pos = l.copy();
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    
    size = random(1, 5);
    r = 3;
    maxspeed = ms;
    maxforce = mf;
  }

  public void run() {
    update();
    borders();
    display();
  }


  // Implementing Reynolds' flow field following algorithm
  // http://www.red3d.com/cwr/steer/FlowFollow.html
  void follow(FlowField flow) {
    // What is the vector at that spot in the flow field?
    PVector desired = flow.lookup(pos);
    // Scale it up by maxspeed
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acc.add(force);
  }

  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);

    c = (int) (clr1.length*100*noise(size) % clr1.length);
  }

  void display() {
    float theta = vel.heading() + radians(90);
    pushMatrix();
    pushStyle();
    fill(clr1[c], 80);
    noStroke();
    translate(pos.x,pos.y);
    rotate(theta);
    //beginShape(TRIANGLES);
    //vertex(0, -r*2);
    //vertex(-r, r*2);
    //vertex(r, r*2);
    //endShape();
    ellipse(0, 0, size, size); //random(size, size*3), random(size, size*3));
    popStyle();
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (pos.x < -r) pos.x = width+r;
    if (pos.y < height/4*3-noise(frameCount*.01)-10) pos.y = random(height/6*5,height);
    //if (position.y < -r) position.y = height+r;
    if (pos.x > width+r) pos.x = -r;
    if (pos.y > height+r) pos.y = -r;
  }
}
