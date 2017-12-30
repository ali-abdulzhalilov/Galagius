class GameScene extends Scene {
  Player p;
  
  GameScene() {
    p = new Player(width/2, height/2, 5);
    objects.add(p);
    
    PoolManager.createPool("bullet", new Bullet(10), 50);
  }
  
  void onEnter() {
    PoolManager.copyToCurScene("bullet");
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
    
    //pool test
    if (Controls.keyPress(' '))
      p.shoot();
  }
  
  void update() {
    for (int i = 0; i < objects.size(); i++) {
      GameObject go = objects.get(i);
      go.update();
    }
  }
  
  void display() {
    background(0);
  
    for (int i = 0; i < objects.size(); i++) {
      GameObject go = objects.get(i);
      go.display();
    }
  }
}