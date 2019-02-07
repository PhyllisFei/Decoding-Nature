class Car {
  CarShape box;
  Wheel wheel1;
  Wheel wheel2;
  //Wheel wheel3;

  Car(float x, float y) {
    box = new CarShape(x, y+8, 100, 12, false);

    //for (int i=0; i<8; i++) {
    //top = new CarShape( (x+100)/2, (y+20)/2, sin(10), 12, false );
    //}

    wheel1 = new Wheel(x-28, y+15, false, 15);
    wheel2 = new Wheel(x+28, y+15, false, 15);
    //wheel3 = new Wheel(x, y+16, false, 12);

    // Define joints
    RevoluteJointDef rjd1 = new RevoluteJointDef();
    rjd1.initialize(box.body, wheel1.body, wheel1.body.getWorldCenter());
    rjd1.motorSpeed = -PI*2;
    rjd1.maxMotorTorque = 3000.0;
    rjd1.enableMotor = true;
    box2d.world.createJoint(rjd1);

    RevoluteJointDef rjd2 = new RevoluteJointDef();
    rjd2.initialize(box.body, wheel2.body, wheel2.body.getWorldCenter());
    rjd2.motorSpeed = -PI*2;
    rjd2.maxMotorTorque = 3000.0;
    rjd2.enableMotor = true;
    box2d.world.createJoint(rjd2);

    //RevoluteJointDef rjd3 = new RevoluteJointDef();
    //rjd3.initialize(box.body, wheel3.body, wheel3.body.getWorldCenter());
    //rjd3.motorSpeed = -PI*2;
    //rjd3.maxMotorTorque = 3000.0;
    //rjd3.enableMotor = true;
    //box2d.world.createJoint(rjd3);
  }

  void display() {
    box.display();
    wheel1.display();
    wheel2.display();
    //wheel3.display();
  }
}

class CarShape {
  Body body;
  float w;
  float h;
  float r;

  CarShape(float x, float y, float w_, float h_, boolean lock) {
    w = w_;
    h = h_;
    r = 10;

    // Define and create the body
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(new Vec2(x, y)));
    if (lock) bd.type = BodyType.STATIC;
    else bd.type = BodyType.DYNAMIC;

    body = box2d.createBody(bd);
    body.setUserData(this);

    //create a semi-circle on the top of the box?????
    CircleShape circle = new CircleShape();
    circle.m_radius = box2d.scalarPixelsToWorld(r);
    Vec2 offset = new Vec2(0, -h/2);
    offset = box2d.vectorPixelsToWorld(offset);
    circle.m_p.set(offset.x, offset.y);

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = .01;
    fd.friction = 0.1;
    fd.restitution = 0.5;

    body.createFixture(fd);

    body.setLinearVelocity(new Vec2(0, 0));
    body.setAngularVelocity(0);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  Vec2 pos() {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    return pos;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(127);
    stroke(0);
    strokeWeight(1);
    //rect(0, 0, w, h);
    ellipse(0, -h/7*4, 95, 30);
    popMatrix();
  }
}

class Wheel {
  Body body;
  float r;
  //boolean noMove=false;

  Wheel(float x, float y, boolean noMove, float radius) {
    r = radius;

    BodyDef bd = new BodyDef();

    bd.position = box2d.coordPixelsToWorld(x, y);

    if (noMove)
      bd.type = BodyType.STATIC;
    else
      bd.type = BodyType.DYNAMIC;
    if (r<10)
      bd.fixedRotation = true; 
    body = box2d.world.createBody(bd);
    body.setUserData(this);
    
    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 10;
    fd.friction = 1;
    fd.restitution = 0.0;

    // Attach fixture to body
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(0, 0));
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }

  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(127);
    stroke(0);
    strokeWeight(2);
    ellipse(0, 0, r*2, r*2);
    line(0, 0, r, 0);
    popMatrix();
    
    if(pos.x>=width){
      start = false;
    }
  }
}