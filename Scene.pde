abstract class Scene {
  ArrayList<GameObject> objects = new ArrayList<GameObject>();
  
  void onEnter() {}
  void onExit() {}
  
  abstract void input();
  abstract void update();
  abstract void display();
  
  void loop() {
    input();
    update();
    display();
  }
}