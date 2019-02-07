import controlP5.*;

ControlP5 cp5;

boolean GUIToogle;

int thresholdMin = 0;

int thresholdChairMin;
int thresholdChairMax;

int chairConfirmationMin;
int chairConfirmationMax;

int chairTopY;
int chairMinX;
int chairMaxX;

int humanConfirmationCount; // if humanCount > this, there is a human

void setupGUI() {
  GUIToogle = true;

  int sliderW = 100;
  int sliderH = 20;

  cp5 = new ControlP5( this );

  //cp5.addSlider("thresholdMin")
  //  .setPosition(10, 20)
  //  .setSize(sliderW, sliderH)
  //  .setRange(1, 4499)
  //  .setValue(0)
  //  ;

  cp5.addSlider("thresholdChairMin")
    .setPosition(10, 50)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(1080)
    ;
  cp5.addSlider("thresholdChairMax")
    .setPosition(10, 70)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(1890)
    ;

  cp5.addSlider("chairConfirmationMin")
    .setPosition(10, 100)
    .setSize(sliderW, sliderH)
    .setRange(1, 10000)
    .setValue(7800)
    ;

  cp5.addSlider("chairConfirmationMax")
    .setPosition(10, 120)
    .setSize(sliderW, sliderH)
    .setRange(1, 10000)
    .setValue(8000)
    ;
  cp5.addSlider("chairTopY")
    .setPosition(10, 150)
    .setSize(sliderW, sliderH)
    .setRange(0, 414)
    .setValue(207)
    ;
    
    cp5.addSlider("chairMinX")
    .setPosition(10, 170)
    .setSize(sliderW, sliderH)
    .setRange(0, 512)
    .setValue(200)
    ;
    cp5.addSlider("chairMaxX")
    .setPosition(10, 190)
    .setSize(sliderW, sliderH)
    .setRange(0, 512)
    .setValue(370)
    ;
    cp5.addSlider("humanConfirmationCount")
    .setPosition(10, 220)
    .setSize(sliderW, sliderH)
    .setRange(0, 20000)
    .setValue(10000)
    ;
    cp5.addSlider("humanInChairMin")
    .setPosition(10, 250)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(1350)
    ;
    cp5.addSlider("humanInChairMax")
    .setPosition(10, 280)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(1620)
    ;
    
    
  cp5.setAutoDraw(false);
}

void addGUI() {
  hint(DISABLE_DEPTH_TEST);
  cp5.draw();
}
