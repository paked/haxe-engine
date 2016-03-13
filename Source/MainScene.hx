package;

import engine.Scene;
import engine.Visual;

class MainScene extends Scene {
  public function new() {
    super();

    add(new Visual());
  }
}
