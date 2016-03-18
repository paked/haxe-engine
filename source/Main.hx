package;

import openfl.display.Sprite;
import engine.Game;

class Main extends Sprite {
  public function new() {
    super();

    addChild(new Game(640, 480, new MainScene(), 2));
  }
}
