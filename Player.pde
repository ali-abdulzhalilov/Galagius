class Player extends GameObject{
  Player(float x, float y, float speed) {
    super(x, y, speed);
    size = 20;
  }
  
  void move(int inX, int inY) {
    dir.x = inX;
    dir.y = inY;
  }
  
  void update() {
    pos.x += dir.x * speed;
    pos.y += dir.y * speed;
    
    pos.x = constrain(pos.x, size/2, width-size/2);
    pos.y = constrain(pos.y, size/2, height-size/2);
    
    dir.mult(0);
  }
  
  void display() {
    noFill();
    
    stroke(0, 100, 0);
    ellipse(pos.x, pos.y, size, size); // collision circle
    
    stroke(0, 255, 0);
    triangle(pos.x,        pos.y-size/2, // visual
             pos.x-size/2, pos.y+size/2,
             pos.x+size/2, pos.y+size/2);
    
  }
}