class Enemy extends PoolObject{
  ArrayList<PVector> waypoints;
  int curWaypointIndex = 0;
  
  Enemy(float speed, float size) {
    super(0, 0, speed);
    this.size = size;
    this.waypoints = new ArrayList<PVector>();
  }
  
  Enemy clone() {
    return new Enemy(speed, size);
  }
  
  void onReuse(float x, float y, float dx, float dy) {
    pos.x = x;
    pos.y = y;
    dir.x = dx;
    dir.y = dy;
    active = true;
    
    for (int i = 0; i < 5; i++) {
      waypoints.add(new PVector(random(width), random(height)));
    }
  }
  
  void make_waypoints(ArrayList<PVector> waypoints) {
    this.waypoints = waypoints;
  }
  
  void destroy() {
    active = false;
  }
  
  void update(float dt) {
    if (active) {
      think();
      
      pos.x += dir.x * speed * dt;
      pos.y += dir.y * speed * dt;
      
      if (pos.x > width) destroy();
      dir.mult(0);
    }
  }
  
  void think() {
    if (waypoints.size() == 0) 
      destroy();
    else {
      PVector point = waypoints.get(0);
      move(point.x-pos.x, point.y-pos.y);
      if (dist(point.x, point.y, pos.x, pos.y) < size)
        waypoints.remove(0);
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