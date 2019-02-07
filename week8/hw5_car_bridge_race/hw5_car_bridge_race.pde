// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example demonstrating revolute joints

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
Box2DProcessing box2d;

Car car;
//Car2 car2;

Bridge bridge;

Surface surface1;
Surface surface2;

Timer timer;

boolean start;

void setup() {
  size(1280, 640);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  box2d.listenForCollisions();

  surface1 = new Surface(0);
  surface2 = new Surface(width/3*2);

  car = new Car(100, 200);

  bridge = new Bridge(width/3, width/25, surface1.yEnd, surface2.yStart);

  timer = new Timer(0);

  start = false;
}

void draw() {
  background(255);
  stroke(1);  
  textSize(15);
  text(timer.getTime(), 10, 20);
  
  // We must always step through time!
  box2d.step();

  surface1.display();
  surface2.display();

  car.display();
  //car2.display();

  bridge.display();
  
  if (start == true ) {
    timer.display();
  }
}

void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if ( (o1.getClass() == Wheel.class && o2.getClass() == Surface.class) 
  || (o1.getClass() == Surface.class && o2.getClass() == Wheel.class) ) {
    start = true;
  }
  //println(o1.getClass());
  //println(o2.getClass());
}

// Objects stop touching each other
void endContact(Contact cp) {
}
