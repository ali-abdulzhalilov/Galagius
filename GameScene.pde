class GameScene extends Scene {
  
  
  void input() {
    if (Controls.keyDown(ESC)) SceneManager.setScene("menu");
  }
  
  void update() {
    
  }
  
  void display() {
    background(0);
  
    fill(255);
    rect(20, 200, 100, 50);
  }
}