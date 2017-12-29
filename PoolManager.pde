static class PoolManager {
  static HashMap<String, ArrayList<IPoolable>> pools = new HashMap<String, ArrayList<IPoolable>>();
  
  static void createPool(String poolName, IPoolable prototype, int amount) {
    ArrayList<IPoolable> pool = new ArrayList<IPoolable>();
    
    for (int i = 0; i < amount; i++) {
      IPoolable thing = prototype.clone();
      pool.add(thing);
    }
    
    pools.put(poolName, pool);
  }
  
  static void copyToCurScene(String poolName) {
    Scene curScene = SceneManager.currentScene;
    if (curScene != null) {
      if (pools.containsKey(poolName)) {
        ArrayList<IPoolable> pool = pools.get(poolName);
        if (pool.get(0).getClass().getSuperclass() == GameObject.class) {
          for (int i = 0; i < pool.size(); i++) {
            GameObject someObject = (GameObject)pool.get(i);
            if (!curScene.objects.contains(someObject))
              curScene.objects.add(someObject);
          }
        }
        else
          println("can't add non-GameObject object to GameObject list, sorry");
      }
      else 
        println("there's no pools called " + poolName);
    }
    else {
      println("current scene is null");
    }
  }
  
  static IPoolable reuseObject(String poolName, float x, float y, float dx, float dy) {
    if (pools.containsKey(poolName)) {
      ArrayList<IPoolable> somePool = pools.get(poolName);
      IPoolable someObject = somePool.remove(0);
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

interface IPoolable {
  IPoolable clone();
  void onReuse(float x, float y, float dx, float dy);
  void destroy();
}