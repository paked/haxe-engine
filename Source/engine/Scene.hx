package engine;

import openfl.display.BitmapData;
import openfl.geom.Point;

class Scene extends Group {
  private var background:BitmapData;

  public function new() {
    super();

    this.background = new BitmapData(800, 800, false, 0x000000);
  }

  override public function draw(display: BitmapData) {
    display.copyPixels(
        background,
        background.rect,
        new Point(0, 0)
    );

    super.draw(display);
  }
}
