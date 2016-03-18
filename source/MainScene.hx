package;

import engine.Scene;
import engine.Visual;
import objects.Table;

class MainScene extends Scene {
  public function new() {
    super();

    add(new Player());

    add(new Table());
  }
}
