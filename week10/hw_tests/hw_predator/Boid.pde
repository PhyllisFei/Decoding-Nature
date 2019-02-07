class Boid {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;
  PVector sep, ali, coh;

  Boid(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    position = new PVector(x, y);
    r = 3.0;
    maxspeed = 3.5;// 3;
    maxforce = 1; //0.05;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
    //escape(predator);
    update();
    borders();
    render();
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids) {
    sep = separate(boids);
    ali = align(boids);
    coh = cohesion(boids);

    //escape(predator);
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  //void escape(PVector target) {
  //  PVector desired = PVector.sub(target, position); 
  //  float d = desired.mag();

  //  //for (Boid : boids) {
  //  if (d<100) {
  //    float m = map(d, 0, 100, maxspeed, 0);
  //    desired.setMag(m);
  //    sep.mult(0.5);
  //    ali.mult(5);
  //    coh.mult(5);
  //  } else {
  //    desired.setMag(maxspeed);
  //    sep.mult(1.5);
  //    ali.mult(1.5);
  //    coh.mult(.5);
  //  }

  //  applyForce(sep);
  //  applyForce(ali);
  //  applyForce(coh);
  //  //}
  //}

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    position.add(velocity);
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

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    fill(255);
    stroke(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    ellipse(0, 0, r*1.5, r*1.5);
    popMatrix();
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
        //println(count);
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed*1.5);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
      //if (count > 0 && count < 50) {
      //  sum.div((float)count);
      //  sum.normalize();
      //  sum.mult(maxspeed*1.5);
      //  PVector steer = PVector.sub(sum, velocity);
      //  steer.limit(maxforce);
      //  return steer;
      //} else if (count > 50 && count <100) {
      //  sum.div((float)count);
      //  sum.normalize();
      //  sum.mult(maxspeed);
      //  PVector steer = PVector.sub(sum, velocity);
      //  steer.limit(maxforce);
      //  return steer;
      //} else if (count > 100 && count < 150) {
      //  sum.div((float)count);
      //  sum.normalize();
      //  sum.mult(maxspeed*.6);
      //  PVector steer = PVector.sub(sum, velocity);
      //  steer.limit(maxforce);
      //  return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average position (i.e. center) of all nearby boids, calculate steering vector towards that position
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all positions
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.position); // Add position
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the position
    } else {
      return new PVector(0, 0);
    }
  }
}
