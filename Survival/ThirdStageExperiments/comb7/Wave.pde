class Wave {
  PVector pos, vel, acc;
  float rad;
  float maxforce;
  float maxspeed;
  int c;
  float r;

  Wave(PVector l, float ms, float mf) {
    pos = l.copy();
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    maxspeed = ms;
    maxforce = mf;
    rad = random(1, 5);
    r = 3;
  }

  public void run() {
    update();
    borders();
    display();
  }

  // ***** wave simulation ***** //
  void follow(FlowField flow) {
    devour = false;

    PVector desired = flow.lookup(pos);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }

  // ***** Ver1: wave moves towards the sun when sun is around the center ***** //
  // ***** Ver2: wave level increases when sun is around the center ***** //
  void devour(ArrayList<Sun> suns) {
    for (Sun sun : suns) {
      PVector sunPos = new PVector (sun.x, sun.y);
      PVector desired = PVector.sub(sunPos, pos);
      desired.mult(maxspeed*2);
      PVector steer = PVector.sub(desired, vel);
      steer.limit(maxforce*1.5);

      if ( sun.pos.x>width/2-50 && sun.pos.x<width/2+50 && sun.pos.y>height/2 ) {
       devour = true;
       //applyForce(steer);
       
       // ***** update flow fleid to increase the wave level ***** //
       yBound = lerp(yBound, 300, 0.01);
       // ***** increase vertex shape ***** //
       //yOffset = lerp(yOffset, 200, 0.01);
       yOffset = map(human.pos.y, 0, height, 0, 200);
       } else {
      // ***** reset flow fleid to the original ***** //
      yBound = lerp(yBound, 600, 0.01);
      // ***** reset vertex shape to the original ***** //
      yOffset = lerp(yOffset, 0, 0.01);
      //yOffset1 = map(human.pos.y, height, height/2, 150, 200);
      //yOffset2 = map(human.pos.y, height/2, height, 0, 200);
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

    c = (int) (clr1.length*100*noise(rad) % clr1.length);
  }

  void display() {
    float theta = vel.heading() + radians(90);
    float alpha = map(pos.y, 600, 800, 70, 130);
    pushMatrix();
    pushStyle();
    noStroke();
    translate(pos.x, pos.y);
    rotate(theta);
    //if (!devour)
    //fill(clr1[c], alpha);
    fill(255, alpha);
    //else 
    //fill( lerpColor( clr1[c], clr2[c], 1));
    ellipse(5*random(sin(1)-3, sin(1)+3), 5*random(cos(1)-3, cos(1)+3), rad/2, rad/2);
    popStyle();
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (!devour) {
      if (pos.x < -r) pos.x = width+r;
      if (pos.x > width+r) pos.x = -r;
      if (pos.y > height) pos.y = random(6000*noise(millis()), height);
    }
  }
}
