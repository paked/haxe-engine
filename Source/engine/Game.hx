package engine;

import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.geom.Point;

class Game extends Sprite {
  private var display: BitmapData;
  private var background: BitmapData;

  private var character: Visual;

  public function new() {
    super();

    addEventListener(Event.ADDED_TO_STAGE, this.create);
  }

  private function create(_) {
    removeEventListener(Event.ADDED_TO_STAGE, this.create);

    this.display = new BitmapData(800, 800);
    var bitmap = new Bitmap(this.display);
    addChild(bitmap);

    this.character = new Visual();

    this.background = new BitmapData(800, 800, false, 0x000000);

    addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  private function onEnterFrame(_) {
    display.copyPixels(
      background,
      background.rect,
      new Point(0, 0)
    );

    character.update(0);

    character.draw(display);
  }
}
