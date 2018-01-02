class Enemy extends PoolObject{
  BehaviorTree tree;
  HashMap<String, Object> data; //blackboard
  
  Enemy(BehaviorTree tree, float speed, float size) {
    super(0, 0, speed);
    this.tree = tree;
    this.data = new HashMap<String, Object>();
    this.size = size;
  }
  
  Enemy clone() {
    return new Enemy(tree, speed, size);
  }
  
  void onReuse(float x, float y, float dx, float dy) {
    pos.x = x;
    pos.y = y;
    dir.x = dx;
    dir.y = dy;
    active = true;
    tree.reset(this);
  }
  
  void destroy() {
    active = false;
  }
  
  void update(float dt) {
    if (active) {
      tree.tick(this);
      
      pos.x += dir.x * speed * dt;
      pos.y += dir.y * speed * dt;
      
      if (pos.x > width) destroy();
      dir.mult(0);
    }
  }
  
  void display() {
    if (active) {
      stroke(100, 0, 0);
      fill(100, 50, 50);
      ellipse(pos.x, pos.y, size, size); // collision circle
      
      stroke(255, 0, 0);
      fill(255, 50, 50);
      triangle(pos.x,        pos.y+size/2, // visual
               pos.x-size/2, pos.y-size/2,
               pos.x+size/2, pos.y-size/2);
    }
  }
}