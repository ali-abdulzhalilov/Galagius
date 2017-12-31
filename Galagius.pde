import java.util.*;

void settings() {
  size(480, 640);
  
}

void setup() {
  SceneManager.addScene("menu", new MenuScene());
  SceneManager.addScene("game", new GameScene());
  
  SceneManager.setScene("game");
}

void keyPressed() {
  Controls.setKey(key, keyCode, true);
  key = 0;
}

void keyReleased() {
  Controls.setKey(key, keyCode, false);
  key = 0;
}

void draw() {
  SceneManager.currentScene.loop();
  Controls.was();
}