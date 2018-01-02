class Bullet extends PoolObject{
  float range;
  private PVector startPos;
  
  Bullet(float speed, float range) {
    super(0, 0, speed);
    this.size = 10;
    this.range = range;
  }
  
  Bullet clone() {
    return new Bullet(speed, range);
  }
  
  void onReuse(float x, float y, float dx, float dy) {
    pos.x = x;
    pos.y = y;
    dir.x = dx;
    dir.y = dy;
    active = true;
    startPos = new PVector(x, y);
  }
  
  void destroy() {
    active = false;
  }
  
  void update(float dt) {
    if (active) {
      pos.x += dir.x * speed * dt;
      pos.y += dir.y * speed * dt;
      
      if ((pos.x < 0 || pos.x > width ||
           pos.y < 0 || pos.y > height) ||
           dist(pos.x, pos.y, startPos.x, startPos.y) > range)
        destroy();
    }
  }
  
  void display() {
    if (active) {
      stroke(0, 0, 255);
      fill(50, 50, 255);
      ellipse(pos.x, pos.y, size, size);
    }
  }
}