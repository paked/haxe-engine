package;

import openfl.Assets;

import engine.Visual;
import engine.Meta;

class Player extends Visual {
  public function new() {
    super(0, 0, Assets.getBitmapData("assets/detective.png"));
  }

  override public function update(dt: Float): Void {
    // Move at a rate of 10px/s
    var xDiff = 10 * dt;

    if (Meta.keys.LEFT.isPressed()) {
      this.x -= xDiff;
    }

    if (Meta.keys.RIGHT.isPressed()) {
      this.x += xDiff;
    }
  }
}
