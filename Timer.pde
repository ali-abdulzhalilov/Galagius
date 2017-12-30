class Timer {
  float startTime;
  float timeSoFar;
  boolean paused = true;
  
  void start() {
    startTime = millis();
    paused = false;
  }
  
  void restart() { 
    start();
  }
  
  void pause() {
    timeSoFar = (millis() - startTime) / 1000.0;
    paused = true;
  }
  
  void resume() {
    startTime = millis() - timeSoFar * 1000.0;
    paused = false;
  }
  
  void toggle() {
    if (paused) resume();
    else pause();
  }
  
  float currentTime() {
    if (!paused) {
      return (millis() - startTime) / 1000.0;
    }
    else {
      return timeSoFar;
    }
  }
}