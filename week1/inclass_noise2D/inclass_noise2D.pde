float xOff = 0;
float yOff = 0;

void setup() {
  size(640, 640);
  noLoop();
}

void draw() {
  loadPixels();
  yOff = 0.0;
  for (int y=0; y<height; y++) {
    yOff += .01;
    xOff = 0;
    for (int x=0; x<width; x++) {
      float brightness = noise(xOff, yOff) * 255;
      xOff += .008;
      int loc = x + y*width;
      pixels[loc] = color(brightness);
    }
  }
  updatePixels();
  //background(0);
  //float x = width * noise(xOff);
  //float y = height * noise(yOff);
  //ellipse(x, y, 30, 30);
  //xOff += .01;
  //yOff += .005;
}
