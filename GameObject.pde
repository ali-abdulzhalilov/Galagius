abstract class GameObject {
  PVector pos;
  PVector dir;
  float speed;
  float size;
  
  GameObject(float x, float y, float speed) {
    this.pos = new PVector(x, y);
    this.dir = new PVector(0, 0);
    this.speed = speed;
  }
  
  void move(float inX, float inY) {
    dir.x = inX;
    dir.y = inY;
    dir.normalize();
  }
  abstract void update(float dt);
  abstract void display();
}