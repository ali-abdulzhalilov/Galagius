class GameScene extends Scene {
  Player p;
  Bullet b;
  
  GameScene() {
    p = new Player(width/2, height/2, 5);
    objects.add(p);
    
    PoolManager.createPool("bullet", new Bullet(1), 50);
    PoolManager.copyToCurScene("bullet");
    println(objects.size());
  }
  
  void onEnter() {
    PoolManager.copyToCurScene("bullet");
    println(objects.size());
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
      PoolManager.reuseObject("bullet", width/2, height/2, random(2)-1, random(2)-1);
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