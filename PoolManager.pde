static class PoolManager {
  static HashMap<String, ArrayList<PoolObject>> pools = new HashMap<String, ArrayList<PoolObject>>();
  
  static void createPool(String poolName, PoolObject prototype, int amount) {
    ArrayList<PoolObject> pool = new ArrayList<PoolObject>();
    
    for (int i = 0; i < amount; i++) {
      PoolObject thing = prototype.clone();
      pool.add(thing);
    }
    
    pools.put(poolName, pool);
  }
  
  static ArrayList<PoolObject> getPool(String poolName) {
    if (pools.containsKey(poolName)) {
      return pools.get(poolName);
    }
    else {
      println("there's no pools called " + poolName);
      return null;
    }
  }
  
  static PoolObject reuseObject(String poolName, float x, float y, float dx, float dy) {
    if (pools.containsKey(poolName)) {
      ArrayList<PoolObject> somePool = pools.get(poolName);
      PoolObject someObject = somePool.remove(0);
      somePool.add(someObject);
      
      someObject.onReuse(x, y, dx, dy);
      
      return someObject;
    }
    else {
      println("there's no pools called " + poolName);
      return null;
    }
  }

}

abstract class PoolObject extends GameObject{
  PoolObject(float x, float y, float speed) {
    super(x, y, speed);
  }
  abstract PoolObject clone();
  abstract void onReuse(float x, float y, float dx, float dy);
  abstract void destroy();
}