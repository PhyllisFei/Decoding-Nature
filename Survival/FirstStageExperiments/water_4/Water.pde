class Wave {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float size;
  float maxforce;
  float maxspeed;
  int c;
  float r;
  float xoff, yoff;

    Wave(PVector l, float ms, float mf) {
    position = l.copy();
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    
    size = random(1, 5);
    r = 3;
    maxspeed = ms;
    maxforce = mf;
    
    xoff = 0;
    yoff = 0;
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
    PVector desired = flow.lookup(position);
    // Scale it up by maxspeed
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    position.add(velocity);
    acceleration.mult(0);
    
    //for(float x = 0; x<width; x += 10){
    //  float y = map(noise(xoff, yoff), 0, 1, 200, 300);
    //  position.x = x;
    //  position.y = y;
      
    //  xoff += 0.05;
    //}
    //yoff += 0.01;
    
    c = (int) (clr1.length*100*noise(size) % clr1.length);
  }

  void display() {
    float theta = velocity.heading() + radians(90);
    pushMatrix();
    pushStyle();
    fill(clr1[c], 80);
    noStroke();
    translate(position.x,position.y);
    rotate(theta);
    //beginShape(TRIANGLES);
    //vertex(0, -r*2);
    //vertex(-r, r*2);
    //vertex(r, r*2);
    //endShape();
    ellipse(0, 0, size, size);
    popStyle();
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < height/4*3-noise(frameCount*.01)-10) position.y = random(height/6*5,height);
    //if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
  }
}
