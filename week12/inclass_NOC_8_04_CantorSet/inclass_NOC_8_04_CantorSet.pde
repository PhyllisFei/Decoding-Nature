// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Cantor Set
// Renders a simple fractal, the Cantor Set

void setup() {
  size(800, 600);
  background(0);
  
  // Call the recursive function
  cantor(20, height, 1000);
}

void draw() {
  noLoop();
}


void cantor(float x, float y, float len) {
  float h = 50;
  
  // recursive exit condition
  if (len >= 2) {
    // Draw line (as rectangle to make it easier to see)
    noStroke();
    fill(255);
    ellipse(x, y, len, h);
    // Go down to next y position
    y -= h*2;
    // Draw 2 more lines 1/3rd the length (without the middle section)
    cantor(x, y, len/3);
    cantor(width/2, height/2, len/3);
    cantor(width-x, height-y, len/3);
  }
}
