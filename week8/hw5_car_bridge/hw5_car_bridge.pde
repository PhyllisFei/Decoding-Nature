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

// An object to describe a Car (a box and two joints)
Car car;

// An object to describe a bridge
Bridge bridge;

// An object to store information about the uneven surface
Surface surface1;
Surface surface2;

void setup() {
  size(640, 480);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // Create the surface
  surface1 = new Surface(0);
  surface2 = new Surface(width/3*2);
  
  // Create the car
  car = new Car(100, 120);
  
  bridge = new Bridge(width/3, width/25, surface1.yEnd, surface2.yStart);
}

void draw() {
  // We must always step through time!
  box2d.step();

  background(255);

  // Draw the surface
  surface1.display();
  surface2.display();

  // Draw the car
  car.display();
  
  //Draw the bridge
  bridge.display();
}
