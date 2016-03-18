package objects;

import openfl.Assets;

import engine.Visual;

class Table extends Visual {
  public function new(x: Int = 0, y: Int = 0) {
    super(x, y, Assets.getBitmapData("assets/table.png"));
  }
}
