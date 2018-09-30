Wave wave;

void setup() {
  size(640,360);
  //frameRate(25);
  
  wave = new Wave(new PVector(0,height/2),width,40,220);
}

void draw() {
  background(255);
  stroke(255, 0, 0);
  strokeWeight(3);
  line(0, height/2, width, height/2);

  wave.calculate();
  wave.display();

}
