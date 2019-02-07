class Wave {
  PVector pos, vel, acc;
  float size;
  float maxforce;
  float maxspeed;
  int c;
  float r;

  Wave(PVector l, float ms, float mf) {
    pos = l.copy();
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);

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
    float alpha = map(pos.y, 600, 800, 50, 110);
    pushMatrix();
    pushStyle();
    //fill(clr1[c], alpha);
    fill(255, alpha);
    noStroke();
    translate(pos.x, pos.y);
    rotate(theta);
    //beginShape(TRIANGLES);
    //vertex(0, -r*2);
    //vertex(-r, r*2);
    //vertex(r, r*2);
    //endShape();
    ellipse(5*random(sin(1)-3, sin(1)+3), 5*random(cos(1)-3, cos(1)+3), size/2, size/2);
    popStyle();
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (pos.x < -r) pos.x = width+r;
    if (pos.x > width+r) pos.x = -r;
    if (pos.y < 650 * noise(1) || pos.y > height) pos.y = random(6000*noise(1), height);
  }

  void changeMode() {
    //if (human.pos.x>width/2 && ) 
    {
    }
  }
}
