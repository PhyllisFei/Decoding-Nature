int steps = 100;

float amp = 100;
float freq = .1;

float angle = 0;
float startAngle;

void setup() {
  size(640, 480);
  //noLoop();
}

void draw() {
  background(255);
  
  /* Oscillation: One Ball
  //float x, y;
  //float osc = sin(angle) * amp;
  //float osc = sin(frameCount * freq) * amp; //freq happens inside the (), amp happens outside
  //x = width/2 + osc; 
  //y = height/2;
  //ellipse(x, y, 40, 40);
  //angle += 1;
  */

  angle = startAngle;
  for (int i=0; i<width; i+=width/steps) {
    float y =  sin(angle) * amp + height/2;
    //y += ( sin(angle*1.2)*70 - cos(angle*3)*120 ) * 1.3;
    //y += sin(freq*cos(angle*3))*amp;
    ellipse(i, y, 10, 10);
    angle += freq;
  }
  startAngle += .01;
}
