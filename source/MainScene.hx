package;

import openfl.Assets;

import engine.Scene;
import engine.Visual;
import engine.Tilemap;

import objects.Table;

class MainScene extends Scene {
  public function new() {
    super();

    // add(new Player());

    // add(new Table());

    var map = [
      [1, 0, 0],
      [0, 1, 0],
      [0, 0, 1]
    ];

    add(new Tilemap(32, 32, map, Assets.getBitmapData("assets/low_vision.png"), 16));
  }
}
