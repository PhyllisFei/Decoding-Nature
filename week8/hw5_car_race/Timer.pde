class Timer {
  float time;
  
  Timer(float set) {
    time = set;
  }
  
  float getTime() {
    return(time);
  }
  
  void display() {
    time += 1/frameRate;
  }
}
