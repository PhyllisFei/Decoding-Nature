class Dot {
  PVector pos, vel, acc;
  float mass;
  float c1, c2;
  int c;

  Dot(float x, float y, float m) {
    mass = m;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    vel.limit(3);
    
    c = (int) (clr.length*100*noise(mass) % clr.length);
  }
  
  void applyRestitution(float rest) {
    float value = 1.0 + rest;
    vel.mult(value);
  }
  
  void checkEdges(){
    if(pos.x > width){
      pos.x = width;
      vel.x *= -1;
    }
    if(pos.x<0){
      pos.x = 0;
      vel.x *= -1;
    }
    if(pos.y > height){
      pos.y = height;
      vel.y *= -1;
    }
    if(pos.y<0){
      pos.y = 0;
      vel.y *= -1;
    }
  }

  void display() {
    pushMatrix();
    pushStyle();
    noStroke();
    fill(clr[c], 230);
    ellipse(pos.x, pos.y, mass, mass);
    popStyle();
    popMatrix();
  }
}
