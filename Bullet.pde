class Bullet extends GameObject implements IPoolable {
  boolean active = false;
  
  Bullet(float speed) {
    super(0, 0, speed);
    size = 5;
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
    }
  }
  
  void display() {
    if (active) {
      stroke(0, 0, 255);
      line(pos.x,            pos.y,
           pos.x-dir.x*size, pos.y-dir.y*size);
    }
  }
}