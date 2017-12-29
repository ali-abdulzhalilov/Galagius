class Player {
  PVector pos;
  PVector dir;
  float speed;
  
  Player(PVector pos, float speed) {
    this.pos = pos;
    this.dir = new PVector();
    this.speed = speed;
  }
  
  void move(int inX, int inY) {
    dir.x = inX;
    dir.y = inY;
  }
  
  void update() {
    pos.x += dir.x * speed;
    pos.y += dir.y * speed;
    
    dir.mult(0);
  }
  
  void display() {
    float w = 20; // size
    
    noFill();
    
    stroke(0, 100, 0);
    ellipse(pos.x, pos.y, w, w); // collision circle
    
    stroke(0, 255, 0);
    triangle(pos.x, pos.y-w/2, // visual
             pos.x-w/2, pos.y+w/2,
             pos.x+w/2, pos.y+w/2);
    
  }
}