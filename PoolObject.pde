abstract class PoolObject extends GameObject{
  boolean active = false;
  PoolObject(float x, float y, float speed) {
    super(x, y, speed);
  }
  abstract PoolObject clone();
  abstract void onReuse(float x, float y, float dx, float dy);
  abstract void destroy();
}