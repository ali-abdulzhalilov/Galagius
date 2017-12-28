static class SceneManager {
  static HashMap<String, Scene> scenes = new HashMap<String, Scene>();
  static Scene currentScene;
  
  static void addScene(String name, Scene scene) {
    scenes.put(name, scene);
  }
  
  static void setScene(String sceneName) {
    if (scenes.containsKey(sceneName)) {
      if (currentScene != null) currentScene.onExit();
      currentScene = scenes.get(sceneName);
      currentScene.onEnter();
    }
    else {
      println("there's no scene called " + sceneName);
    }
  }
}