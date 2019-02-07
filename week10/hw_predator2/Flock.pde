// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flock class
// Does very little, simply manages the ArrayList of all the boids

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    for (int i=0; i<boids.size(); i++) {
      Boid b = boids.get(i);
      b.run(boids);  // Passing the entire list of boids to each boid individually
      for (int j=0; j<boids.size(); j++) {
        if (i!=j) {
          Boid otherBoid = boids.get(j);
          b.connect(otherBoid);
        }
      }
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }
}
