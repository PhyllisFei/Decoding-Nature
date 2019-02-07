// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flock class
// Does very little, simply manages the ArrayList of all the boids

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids
  float[][] points;
  boolean displayVoronoi;

  Flock(int n) {
    boids = new ArrayList(); // Initialize the ArrayList
    displayVoronoi = false;
    points = new float[n][2];
  }

  void run() {
    for (int i=0; i<boids.size(); i++) {
      Boid b = boids.get(i);
      b.run(boids);  // Passing the entire list of boids to each boid individually
      points[i][0] = b.position.x;
      points[i][1] = b.position.y;
    }
    if (displayVoronoi)drawVoronoi();
  }

  void drawVoronoi() {
    Voronoi v = new Voronoi(points);
    float[][] edges = v.getEdges();
    for (int i = 0; i < edges.length; i++) {
      float[] edge = edges[i];
      PVector start = new PVector(edge[0], edge[1]);  
      PVector end = new PVector(edge[2], edge[3]);  
      float dist = PVector.sub(start, end).mag();
      float alpha = map(dist, 70, 90, 100, 0);
      float c = map(.5*(edge[0]+edge[2]), 0, width, 0, 255);
      pushStyle();
      stroke(random(c), random(c-100), random(c+50), alpha*1.8);
      //strokeWeight(abs(int(map(alpha,0,100,1,2))));
      line(start.x, start.y, end.x, end.y);
      popStyle();
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

  void toggleDisplayVoronoi() {
    displayVoronoi = !displayVoronoi;
  }
}
