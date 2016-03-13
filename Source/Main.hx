package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;

class Main extends Sprite {
  public function new() {
    super();

    var bitmapData = Assets.getBitmapData("assets/detective.png");
    var bitmap = new Bitmap(bitmapData);
    addChild(bitmap);
  }
}
