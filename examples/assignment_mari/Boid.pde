// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Boid class
// Methods for Separation, Cohesion, Alignment added

//TO DO 
//After certain millis, increase value of d so more lines are added for larger radius, make color more vibrant 
//Play with colors - more transparent, more vibrant? 
//change background color according to frameCount/millis (mapping)  
//change color of lines according to sine wave (how close they are) -- make sine wave change slower!!
//Import pngs and substitute with particles 
//make sin wave change slower 

class Boid {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float xOff; 
  float yOff=1; 
  boolean predate; 
  float angle = PI;
  float colorr; 
  float alignValue; 

  Boid(float x, float y, boolean kill, float color_, float r1, float _alignValue) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    position = new PVector(x, y);
    r = r1;
    maxspeed = 2;
    maxforce = 0.05;
    predate = kill;
    colorr = color_;
    alignValue = _alignValue;
  }

  void run(ArrayList<Boid> boids, int m, float rmsValue) {
    flock(boids, m, rmsValue);
    update();
    borders();
    render();
    angle+=.007;
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids, int m, float rmsValue) {
    int milli = m;
    float value = rmsValue; 
    PVector sep = separate(boids);   // Separation
    PVector sepPred = separatePredator(boids); 
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids, milli, value);   // Cohesion

    sep.mult(2);
    ali.mult(sin(angle)*2.5);
    coh.mult(sin(cos(angle))+2);

    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(sepPred);
    applyForce(ali);
    applyForce(coh);
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  // Wraparound
  void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separatePredator (ArrayList<Boid> boids) {
    float desiredseparation = 100;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)

      if ((d > 0) && (d < desiredseparation)) {
        if (predate == false && other.predate == true) {
          //println("SEPARATE"); 
          // Calculate vector pointing away from neighbor
          PVector diff = PVector.sub(position, other.position);
          diff.normalize();
          diff.div(d);        // Weight by distance
          steer.add(diff);
          count++;            // Keep track of how many
          maxspeed = 5;
        }
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      //steer.limit(maxforce);
    }
    return steer;
  }

  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average position (i.e. center) of all nearby boids, calculate steering vector towards that position
  PVector cohesion (ArrayList<Boid> boids, int milli, float value) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all positions
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      //ADDING LINES, CHANGING COLOR + MODES
      float red = map(milli, 0, 50000, 200, 100); 
      float green = map(milli, 0, 20000, 90, 150); 
      float blue = map(milli, 0, 20000, 100, 255); 
      strokeWeight(value);
      if (milli < 69000) {
        if (d < 50) {
          stroke(green, red, blue, 60);
          line(position.x, position.y, other.position.x, other.position.y);
        }
      } else {
        //FINISHING THE SKETCH 
        if (d < 50) {
          stroke(0);
          //stroke(250, 150, 100, 60);
          line(position.x, position.y, other.position.x, other.position.y);
        }
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the position
    } else {
      return new PVector(0, 0);
    }
  }

  void render() {
    float theta = velocity.heading2D() + radians(90);
  }
}
