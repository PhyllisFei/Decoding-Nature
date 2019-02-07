import controlP5.*;

ControlP5 cp5;

boolean GUIToogle;

int thresholdMin = 0;
int thresholdMax = 4499;

void setupGUI() {
  GUIToogle = true;

  int sliderW = 100;
  int sliderH = 20;

  cp5 = new ControlP5( this );

  cp5.addSlider("thresholdMin")
    .setPosition(10, 40)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(0)
    ;
  cp5.addSlider("thresholdMax")
    .setPosition(10, 70)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(4499)
    ;
  cp5.setAutoDraw(false);
}

void addGUI() {
  hint(DISABLE_DEPTH_TEST);
  cp5.draw();
}
