// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Series of Particles connected with distance joints

class Bridge {
  float totalLength;
  int numPoints;

  ArrayList<Particle2> particles;

  Bridge(float l, int n, float yStart, float yEnd) {
    totalLength = l;
    numPoints = n;

    particles = new ArrayList();

    float len = totalLength / numPoints;

    // Here is the real work, go through and add particles to the chain itself
    for (int i=0; i < numPoints+1; i++) {
      // Make a new particle
      Particle2 p = null;

      // First and last particles are made with density of zero
      //if (i == 0 || i == numPoints) p = new Particle2(i*len+width/3, height/2, 4, true);
      if (i == 0) p = new Particle2(i*len+width/3, yStart, 4, true);
      else if (i == numPoints) p = new Particle2(i*len+width/3, yEnd, 4, true);
      else p = new Particle2(i*len+width/3, (yStart+yEnd)/2, 4, false);
      particles.add(p);

      // Connect the particles with a distance joint
      if (i > 0) {
        DistanceJointDef djd = new DistanceJointDef();
        Particle2 previous = particles.get(i-1);
        // Connection between previous particle and this one
        djd.bodyA = previous.body;
        djd.bodyB = p.body;
        // Equilibrium length
        djd.length = box2d.scalarPixelsToWorld(len);
        // These properties affect how springy the joint is 
        djd.frequencyHz = 0;
        djd.dampingRatio = 0;

        // Make the joint.  Note we aren't storing a reference to the joint ourselves anywhere!
        // We might need to someday, but for now it's ok
        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
      }
    }
  }

  void display() {
    for (Particle2 p : particles) {
      p.display();
    }
  }
}
