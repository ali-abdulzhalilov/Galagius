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
  
  void move(int inX, int inY) {
    dir.x = inX;
    dir.y = inY;
  }
  abstract void update();
  abstract void display();
}