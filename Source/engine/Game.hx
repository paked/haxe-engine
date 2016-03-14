package engine;

import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.geom.Point;

class Game extends Sprite {
  private var display: BitmapData;

  private var scene: Scene;

  private var gameWidth: Int;
  private var gameHeight: Int;
  private var time: Float;

  public function new(width: Int, height: Int, scene: Scene) {
    super();

    this.gameWidth = width;
    this.gameHeight = height;

    this.changeScene(scene);

    addEventListener(Event.ADDED_TO_STAGE, this.create);
  }

  public function changeScene(scene: Scene) {
    this.scene = scene;
  }

  private function create(_) {
    removeEventListener(Event.ADDED_TO_STAGE, this.create);

    this.time = Date.now().getTime();

    this.display = new BitmapData(gameWidth, gameHeight);

    var bitmap = new Bitmap(this.display);
    addChild(bitmap);

    addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  private function onEnterFrame(_) {
    var now = Date.now().getTime();

    // This seems to work!
    var dt = (now - this.time) / 100;

    scene.update(dt);
    scene.draw(display);

    this.time = now;
  }
}
