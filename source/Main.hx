package;

import openfl.display.Sprite;
import engine.Game;

class Main extends Sprite {
  public function new() {
    super();

    addChild(new Game(800, 800, new MainScene()));
  }
}
