boolean onlyHasChair;
boolean adjusting = false;
int humanInChairMin = 1350;
int humanInChairMax= 1620;

class Human {
  float sumX;
  float sumY;
  int humanCount;
  int chairCount;
  int humanInChairCount=0;
  boolean humanInChair=false;
  float scaleX = 3.8;
  float scaleY = 2.5;


  // Raw location
  PVector loc;
  // Interpolated location
  PVector lerpedLoc;
  // Depth data
  int[] depth;
  PImage display;
  Kinect2 kinect2;
  boolean humanPresent=false;

  Human(PApplet pa) {

    kinect2 = new Kinect2(pa);
    kinect2.initDepth();
    kinect2.initDevice();

    display = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);

    loc = new PVector(0, 0);
    lerpedLoc = new PVector(0, 0);
  }

  void track() {
    // Get the raw depth as array of integers
    depth = kinect2.getRawDepth();

    // Being overly cautious here
    if (depth == null) return;

    sumX = 0;
    sumY = 0;
    humanCount = 0;
    chairCount = 0;

    for (int i=0; i < depth.length; i++) {
      int rawDepth = depth[i];
      int x = i % kinect2.depthWidth;
      int y = floor(i / kinect2.depthWidth);

      //find human
      if (rawDepth <= thresholdChairMin 
        && rawDepth != 0) {
        sumX += x; 
        sumY += y; 
        humanCount++;
      }

      //find chair
      if (rawDepth >= humanInChairMin
        && rawDepth <= humanInChairMax
        && y > chairTopY  && y < 370 && x > chairMinX && x < chairMaxX
        && rawDepth != 0)
        humanInChairCount++;


      if (rawDepth >= thresholdChairMin
        && rawDepth <= thresholdChairMax
        && y > chairTopY  && x > chairMinX && x < chairMaxX
        && rawDepth != 0)
        chairCount++;
    }

    if (humanCount > 100) {
      loc = new PVector(sumX/humanCount*1.8, sumY/humanCount);
      humanPresent=true;
    } else humanPresent=false;

    if (humanInChairCount>100)
      humanInChair =true;
    else 
    humanInChair=false;

    //println(chairCount);
    if (chairCount > chairConfirmationMin
      && humanCount<humanConfirmationCount) onlyHasChair = true; // 22000
    if (chairCount < chairConfirmationMin
      && humanCount>humanConfirmationCount) onlyHasChair = false;



    // Interpolating the location, doing it arbitrarily for now
    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }

  PVector getLerpedPos() {
    return lerpedLoc;
  }

  PVector getPos() {
    return loc;
  }

  void display() {
    PImage img = kinect2.getDepthImage();

    // Being overly cautious here
    if (depth == null || img == null) return;

    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    display.loadPixels();
    for (int x = 0; x < kinect2.depthWidth; x++) {
      for (int y = 0; y < kinect2.depthHeight; y++) {
        // mirroring image
        int offset = (kinect2.depthWidth - x - 1) + y * kinect2.depthWidth;
        // Raw depth
        int rawDepth = depth[offset];
        int pix = x + y*display.width;
        //&& y > chairTopY && x > chairMinX && x < chairMaxX
        if (rawDepth >= humanInChairMin
          && rawDepth <= humanInChairMax
          && y > chairTopY  && y <370 && x > chairMinX && x < chairMaxX
          && rawDepth != 0
          ) {
          // A red color instead
          display.pixels[pix] = color(150, 50, 50);
        } else {
          //displaySun = false;
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels();

    // Draw the image
    pushMatrix();
    pushStyle();

    translate(width/2-256, height/2-207);
    fill(255);
    println("Human Count:\t"+humanCount);
    println("Chair Count:\t"+chairCount);
    println("Only has chair:\t"+onlyHasChair);
    println("human present:\t"+humanPresent);

    image(display, 0, 0);
    popStyle();
    popMatrix();
  }
}
