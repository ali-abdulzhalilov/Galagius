class MenuScene extends Scene {
  
  void input() {
    if (Controls.keyDown(ESC)) exit();
  }
  
  void update() {
    
  }
  
  void display() {
    background(0);
  
    fill(255);
    text("MENU", width/2, height/2);
  }
}