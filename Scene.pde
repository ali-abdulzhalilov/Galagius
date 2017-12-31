abstract class Scene {
  Timer tickTimer;
  float oldTickTime;
  
  Scene() {
    tickTimer = new Timer();
    tickTimer.start();
    oldTickTime = tickTimer.currentTime();
  }
  
  ArrayList<GameObject> objects = new ArrayList<GameObject>();
  
  void onEnter() {
    tickTimer.restart();
    oldTickTime = tickTimer.currentTime();
  }
  void onExit() {
    tickTimer.pause(); // not actually necessary
  }
  
  abstract void input();
  abstract void update(float dt);
  abstract void display();
  
  void loop() {
    input();
    
    float dt = tickTimer.currentTime() - oldTickTime;
    update(dt);
    oldTickTime = tickTimer.currentTime();
    
    display();
  }
}