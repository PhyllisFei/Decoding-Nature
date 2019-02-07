// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// An uneven surface boundary

class Surface {
  // We'll keep track of all of the surface points
  ArrayList<Vec2> surface;
  float xStart;
  float yStart, yEnd;

  Surface(float xStart_) {
    surface = new ArrayList<Vec2>();
    xStart = xStart_;

    float yoff = 0.0;
    // Here we keep track of the screen coordinates of the chain
    //for (float x=width+10; x>-10; x-=5) {
    for (float x=xStart; x<xStart+width/3; x+=5) {
      yoff += 0.08;
      float n = noise(yoff);
      float y = map(n, 0, 1, height/2-30, height/2+30);

      //surface.add(new Vec2(x/3, y));
      //surface.add(new Vec2(width-x/3, y));
      surface.add(new Vec2(x, y));

      if (x==xStart) {
        yStart=y;
      }
      yEnd = y;
    }

    // This is what box2d uses to put the surface in its world
    ChainShape chain = new ChainShape();

    // We can add 3 vertices by making an array of 3 Vec2 objects
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }

    chain.createChain(vertices, vertices.length);

    // The edge chain is now a body!
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    // Shortcut, we could define a fixture if we
    // want to specify frictions, restitution, etc.
    body.createFixture(chain, 1);
  }

  // A simple function to just draw the edge chain as a series of vertex points
  void display() {
    strokeWeight(1);
    stroke(0);
    noFill();
    beginShape();
    for (Vec2 v : surface) {
      vertex(v.x, v.y);
    }
    endShape();
  }
}
