class Player extends GameObject{
  Timer fireRateTimer;
  float fireRate = 0.1;
  
  Player(float x, float y, float speed) {
    super(x, y, speed);
    size = 20;
    fireRateTimer = new Timer();
    fireRateTimer.start();
  }
  
  void shoot() {
    if (fireRateTimer.currentTime() >= fireRate) {
      PoolManager.reuseObject("bullet", pos.x+size*0.75, pos.y+size*0.25,  0.75, -1);
      PoolManager.reuseObject("bullet", pos.x+size*0.5 , pos.y          ,   0.5, -1);
      PoolManager.reuseObject("bullet", pos.x+size*0.25, pos.y-size*0.25,  0.25, -1);
      PoolManager.reuseObject("bullet", pos.x          , pos.y-size*0.5 ,     0, -1);
      PoolManager.reuseObject("bullet", pos.x-size*0.25, pos.y-size*0.25, -0.25, -1);
      PoolManager.reuseObject("bullet", pos.x-size*0.5 , pos.y          ,  -0.5, -1);
      PoolManager.reuseObject("bullet", pos.x-size*0.75, pos.y+size*0.25, -0.75, -1);
      fireRateTimer.restart();
    }
  }
  
  void update(float dt) {
    pos.x += dir.x * speed * dt;
    pos.y += dir.y * speed * dt;
    
    pos.x = constrain(pos.x, size/2, width-size/2);
    pos.y = constrain(pos.y, size/2, height-size/2);
    
    dir.mult(0);
  }
  
  void display() {
    stroke(0, 100, 0);
    fill(50, 100, 50);
    ellipse(pos.x, pos.y, size, size); // collision circle
    
    stroke(0, 255, 0);
    fill(50, 255, 50);
    triangle(pos.x,        pos.y-size/2, // visual
             pos.x-size/2, pos.y+size/2,
             pos.x+size/2, pos.y+size/2);
  }
}