class Path {
  ArrayList<PVector> points;
  float radius;

  Path() {
    radius = 2;
    points = new ArrayList<PVector>();
  }

  void addPoint(float x, float y) {
    PVector point = new PVector(x, y);
    radius += .5;
    points.add(point);
  }

  PVector getStart() {
    return points.get(0);
  }

  PVector getEnd() {
    return points.get(points.size()-1);
  }

  void display() {
    stroke(175);
    strokeWeight(radius*8);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape();
    stroke(0);
    strokeWeight(1);
    noFill();
    //beginShape();
    //for (PVector v : points) {
    //  vertex(v.x, v.y);
    //}
    //endShape();
  }
}
