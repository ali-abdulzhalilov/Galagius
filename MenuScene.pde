class MenuScene extends Scene {
  
  void input() {
    if (Controls.keyDown(ESC)) exit();
    if (Controls.keyDown(' ')) SceneManager.setScene("game");
  }
  
  void update(float dt) {
    
  }
  
  void display() {
    background(0);
  
    fill(255);
    text("MENU", width/2, height/2);
  }
}