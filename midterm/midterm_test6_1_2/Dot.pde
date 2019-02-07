class Dot {
  PVector pos, vel, acc;
  float mass;

  Dot(float x, float y, float m) {
    x = cos(angle)*r;
    y = sin(angle)*r;
    mass = m;
    r = 1.0*randomGaussian() + (width/2-100)*(1.0-pow(random(1.0), 7.0));
    angle = random(TWO_PI);

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
  }
  
  void attract(Dot otherd) {
    PVector force = PVector.sub(pos, otherd.pos);
    float distance = force.mag();
    float angle = force.heading();
    
    if (distance < 200) {
      force.mult(-.03);
      //vector.mult(-0.1*sin(mass/10));
      applyForce(force);
    }
  }
  
  void checkEdges(){
    if(pos.x > 700-width/2){
      pos.x = 700;
    }
    if(pos.x < 100){
      pos.x = 100;
    }
    if(pos.y > 700-height/2){
      pos.y = 700;
    }
    if(pos.y < 100){
      pos.y = 100;
    }
  }
  
  void display() {
    fill(255);
    noStroke();
    ellipse(pos.x+width/2, pos.y+height/2, mass, mass);
  }
}
