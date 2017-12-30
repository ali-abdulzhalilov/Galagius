class Enemy extends PoolObject{
  boolean active = false;
  
  Enemy(float speed) {
    super(0, 0, speed);
    size = 20;
  }
  
  Enemy clone() {
    return new Enemy(speed);
  }
  
  void onReuse(float x, float y, float dx, float dy) {
    pos.x = x;
    pos.y = y;
    dir.x = dx;
    dir.y = dy;
    active = true;
  }
  
  void destroy() {
    active = false;
  }
  
  void update() {
    if (active) {
      pos.x += dir.x * speed;
      pos.y += dir.y * speed;
      
      if (pos.x > width) destroy();
      //dir.mult(0);
    }
  }
  
  void display() {
    if (active) {
      noFill();
      
      stroke(100, 0, 0);
      ellipse(pos.x, pos.y, size, size); // collision circle
      
      stroke(255, 0, 0);
      triangle(pos.x,        pos.y+size/2, // visual
               pos.x-size/2, pos.y-size/2,
               pos.x+size/2, pos.y-size/2);
    }
  }
}