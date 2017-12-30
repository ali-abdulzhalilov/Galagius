class Bullet extends PoolObject{
  boolean active = false;
  
  Bullet(float speed) {
    super(0, 0, speed);
    size = 10;
  }
  
  Bullet clone() {
    return new Bullet(speed);
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
      
      if (pos.x < 0 || pos.x > width ||
          pos.y < 0 || pos.y > height)
        destroy();
    }
  }
  
  void display() {
    if (active) {
      stroke(0, 0, 255);
      noFill();
      ellipse(pos.x, pos.y, size, size);
    }
  }
}