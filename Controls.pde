static class Controls {
  static private boolean[] keys = new boolean[255];
  static private boolean[] wasKeys = new boolean[255];

  static void setKey(int k, int kCode, boolean value) {
    if (k == CODED)
      keys[kCode] = value;
    else
      keys[k] = value;
  }
  
  static void was() {
    for (int i = 0; i < keys.length; i++)
      wasKeys[i] = keys[i];
  }
  
  static boolean keyDown(int k) {
    return !wasKeys[k] && keys[k];
  }
  
  static boolean keyUp(int k) {
    return wasKeys[k] && !keys[k];
  }
  
  static boolean keyPress(int k) {
    return keys[k];
  }
}