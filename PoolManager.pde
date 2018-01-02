static class PoolManager {
  static HashMap<String, ArrayList<PoolObject>> pools = new HashMap<String, ArrayList<PoolObject>>();
  
  static <T extends PoolObject> ArrayList<T> createPool(String poolName, PoolObject prototype, int amount) {
    ArrayList<PoolObject> pool = new ArrayList<PoolObject>();
    
    for (int i = 0; i < amount; i++) {
      PoolObject thing = prototype.clone();
      pool.add(thing);
    }
    
    pools.put(poolName, pool);
    
    return getPool(poolName);
  }
  
  static <T extends PoolObject> ArrayList<T> getPool(String poolName) {
    if (pools.containsKey(poolName)) {
      ArrayList<T> tmp = new ArrayList<T>();
      ArrayList<PoolObject> pool = pools.get(poolName);
      
      for (int i = 0; i < pool.size(); i++) { //i know, this is not great idea
        tmp.add((T)pool.get(i));              //but i'll so something with it later, so
      }                                       //TODO: find a better solution
      
      return tmp;
    }
    else {
      println("there's no pool called " + poolName);
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