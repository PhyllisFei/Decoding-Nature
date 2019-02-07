//predator class extends boid class
class Predator extends Boid {
  //how strong the predator repels the prey
  float predatorStrength1 = 3000;
  //how far away the prey is before being affected
  float desiredseparation1 = 70;

  //how strong the predator repels the prey
  float predatorStrength2 = 5000;
  //how far away the prey is before being affected
  float desiredseparation2 = 150;

  float alpha;
  float c;

  Predator(float x, float y) {
    super(x, y); 
    r = 5;
  }

  //new run function, we don't need to pass in all the boids here
  void run() {
    update();
    borders();
    render();
    //connect1(flock.boids);
    //checkEdges();
  }

  //new render function just to draw it red
  void render() {
    float theta = velocity.heading() + radians(90);
    fill(255, 0, 0);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape(TRIANGLES);
    //vertex(0, -r*2);
    //vertex(-r, r*4);
    //vertex(r, r*4);
    endShape();
    popMatrix();
  }

  //here we will affect all the other boids
  void predate1(ArrayList<Boid> boids) {
    run();
    for (Boid b : boids) {
      float d = PVector.dist(position, b.position);
      // If the distance is greater than an arbitrary amount 
      if (d < desiredseparation1 || d < desiredseparation2) {
        // Calculate vector pointing away from us, toward prey
        PVector diff = PVector.sub(b.position, position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        //set how strong the predator's repel force is
        diff.mult(predatorStrength1);
        // Implement Reynolds: Steering = Desired - Velocity
        diff.sub(velocity);
        //don't limit force and apply to the boid
        b.applyForce(diff);
      }
    }
  }
  
  //void predate2(ArrayList<Boid> boids) {
  //  run();
  //  for (Boid b : boids) {
  //    float d = PVector.dist(position, b.position);
  //    // If the distance is greater than an arbitrary amount 
  //    if (d < desiredseparation2) {
  //      // Calculate vector pointing away from us, toward prey
  //      PVector diff = PVector.sub(b.position, position);
  //      diff.normalize();
  //      diff.div(d);        // Weight by distance
  //      //set how strong the predator's repel force is
  //      diff.mult(predatorStrength2/2);
  //      // Implement Reynolds: Steering = Desired - Velocity
  //      diff.sub(velocity);
  //      //don't limit force and apply to the boid
  //      b.applyForce(diff);
  //    }
  //  }
  //}

  void connect1(ArrayList<Boid> boids) {
    for (Boid b : boids) {
      float dist1 = dist(position.x, position.y, b.position.x, b.position.y);
      alpha = map(dist1, 300, width, 15, 0);
      c = map(position.x, 0, width, 0, 255);

      if (dist1 > 350) {
        stroke(random(c), random(c-100), random(c+50), alpha*1.8);
        line(position.x, position.y, b.position.x, b.position.y);
      }
    }

    //float dist2 = dist(predator1.position.x, predator1.position.y, predator2.position.x, predator2.position.y);
    //if (dist2>200) {
    //  pushMatrix();
    //  pushStyle();
    //  stroke(random(c), random(c-100), random(c+50), alpha*3.8);    
      //line(predator1.position.x, predator1.position.y, predator2.position.x, predator2.position.y );
      //popStyle();
      //popMatrix();
    //}
  }

  //void checkEdges() {
  //  if (position.x>=width) {
  //    position.x = width;
  //    velocity.x *= -10;
  //  }
  //  if (position.x<=0) {
  //    position.x = 0;
  //    velocity.x *= -10;
  //  }
  //  if (position.y>=height) {
  //    position.x = height;
  //    velocity.y *= -10;
  //  }
  //  if (position.y<=0) {
  //    position.y = 0;
  //    velocity.y *= -10;
  //  }
  //}
}
