class Fly {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;
  //boolean approaching;

  Fly( PVector l, float ms, float mf) {
    position = l.copy();
    r = 4.0;
    maxspeed = ms;
    maxforce = mf;
    acceleration = new PVector(0, 0);
    velocity = new PVector(maxspeed, 0);
  }

  public void run() {
    if (!pause) 
      update();
    display();
  }

  void follow(Path p) {
    //approaching = true;

    PVector predict = velocity.copy();
    predict.normalize();
    predict.mult(10);
    PVector predictpos = PVector.add(position, predict);

    PVector normal = null;
    PVector target = null;
    float worldRecord = 1000000;

    for (int i = 0; i < p.points.size()-1; i++) {
      // Look at a line segment
      PVector a = p.points.get(i);
      PVector b = p.points.get(i+1);

      PVector normalPoint = getNormalPoint(predictpos, a, b);
      if (dist(normalPoint.x, normalPoint.y, a.x, a.y) + dist(normalPoint.x, normalPoint.y, b.x, b.y)>dist(b.x, b.y, a.x, a.y)+1) {
        //if (i<p.points.size()-2)
        //  normalPoint = p.points.get(i+2);//
        //else 
        normalPoint = b.copy();
      }

      float distance = PVector.dist(predictpos, normalPoint);
      if (distance < worldRecord) {
        worldRecord = distance;
        normal = normalPoint;

        PVector dir = PVector.sub(b, a);
        dir.normalize();
        dir.mult(10);
        target = normalPoint.copy();
        target.add(dir);
      }
    }

    if (worldRecord > p.radius) {
      seek(target);
    }

    if (debug) {
      // Draw predicted future position
      stroke(0);
      fill(0);
      line(position.x, position.y, predictpos.x, predictpos.y);
      ellipse(predictpos.x, predictpos.y, 4, 4);

      // Draw normal position
      stroke(0);
      fill(0);
      ellipse(normal.x, normal.y, 4, 4);
      // Draw actual target (red if steering towards it)
      line(predictpos.x, predictpos.y, normal.x, normal.y);
      if (worldRecord > p.radius) fill(255, 0, 0);
      noStroke();
      ellipse(target.x, target.y, 8, 8);
    }
  }

  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    PVector ap = PVector.sub(p, a);
    PVector ab = PVector.sub(b, a);
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    position.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  // STEER = DESIRED MINUS VELOCITY
  void seek(PVector target) {
    PVector desired = PVector.sub(target, position);
    float d = desired.mag();
    if (d==0) return;
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void arrive1(PVector destination) {
    if (position.x > width/2-75) {
      //approaching = false;
      PVector dest = PVector.sub(destination, position);
      float d = dest.mag();
      if (d < 75) {
        float m = map(d, 0, 100, 0, maxspeed);
        dest.setMag(m);
      } else {
        dest.setMag(maxspeed);
      }
      PVector steer = PVector.sub(dest, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }

  void arrive2(PVector destination) {
    if (position.y > height/10+190) {
      //approaching = false;
      PVector dest = PVector.sub(destination, position);
      float d = dest.mag();
      if (d < 100) {
        float m = map(d, 0, 100, 0, maxspeed);
        dest.setMag(m);
      } else {
        dest.setMag(maxspeed);
      }
      PVector steer = PVector.sub(dest, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }
  
  void arrive3(PVector destination) {
    if (position.x < width/8*7-100) {
      //approaching = false;
      PVector dest = PVector.sub(destination, position);
      float d = dest.mag();
      if (d < 150) {
        float m = map(d, 0, 150, 0, maxspeed);
        dest.setMag(m);
      } else {
        dest.setMag(maxspeed);
      }
      PVector steer = PVector.sub(dest, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }

    void display() {
      // Draw a triangle rotated in the direction of velocity
      float theta = velocity.heading2D() + radians(90);
      fill(0);
      stroke(0);
      pushMatrix();
      translate(position.x, position.y);
      rotate(theta);
      //beginShape(PConstants.TRIANGLES);
      //pushStyle();
      //fill(0, 0, 120);
      //rect(-r*3/2, 0, r*3, r*6);
      //popStyle();
      //ellipse(r*2, r*3/2, 5, 5);
      //ellipse(r*2, r*3/2+12, 5, 5);
      //endShape();
      image(fly, 0, 0);
      popMatrix();
    }

    // Wraparound
    void borders(Path p) {
      if (position.x > p.getEnd().x + r) {
        position.x = p.getStart().x - r;
        position.y = p.getStart().y + (position.y-p.getEnd().y);
      }
    }
  }
