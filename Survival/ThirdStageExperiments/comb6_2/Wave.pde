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

  // ***** wave simulation ***** //
  void follow(FlowField flow) {
    devour = false;

    PVector desired = flow.lookup(pos);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }

  // ***** wave moves to the sun when sun is around the center ***** //
  void devour(ArrayList<Sun> suns) {
    for (Sun sun : suns) {
      PVector sunPos = new PVector (sun.x, sun.y);
      PVector desired = PVector.sub(sunPos, pos);
      desired.mult(maxspeed*2);
      PVector steer = PVector.sub(desired, vel);
      steer.limit(maxforce*1.5);
      if ( sun.pos.x>width/2-50 && sun.pos.x<width/2+50 ) { // && sun.pos.y>height/2
        devour = true;
        applyForce(steer);
      }
    }
  }

  void applyForce(PVector force) {
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
    int c = color(255, 0, 0);
    pushMatrix();
    pushStyle();
    if (!devour)
      //fill(clr1[c], alpha);
      fill(255, alpha);
    else 
    //fill( lerpColor( clr1[c], clr2[c], .50));
    fill( lerpColor( 255, c, 1));
    noStroke();
    translate(pos.x, pos.y);
    rotate(theta);
    ellipse(5*random(sin(1)-3, sin(1)+3), 5*random(cos(1)-3, cos(1)+3), size/2, size/2);
    popStyle();
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (!devour) {
      if (pos.x < -r) pos.x = width+r;
      if (pos.x > width+r) pos.x = -r;
      if (pos.y < 650 * noise(1) || pos.y > height) pos.y = random(6000*noise(1), height);
    }
  }
}
