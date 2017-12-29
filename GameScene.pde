class GameScene extends Scene {
  Player p;
  
  GameScene() {
    p = new Player(new PVector(width/2, height/2), 5);
  }
  
  void input() {
    // scene actions
    if (Controls.keyDown(ESC)) SceneManager.setScene("menu");
    
    //player controools
    int inX = 0, inY = 0;
    if (Controls.keyPress(UP))    inY -= 1;
    if (Controls.keyPress(DOWN))  inY += 1;
    if (Controls.keyPress(LEFT))  inX -= 1;
    if (Controls.keyPress(RIGHT)) inX += 1;
    p.move(inX, inY);
  }
  
  void update() {
    p.update();
  }
  
  void display() {
    background(0);
  
    fill(255);
    //rect(20, 200, 100, 50);
    
    p.display();
  }
}