package engine;

import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.StageScaleMode;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.geom.Point;
import openfl.Lib;

class Game extends Sprite {
  private var display: Bitmap;
  private var canvas: BitmapData;

  private var scene: Scene;

  private var gameWidth: Int;
  private var gameHeight: Int;

  private var time: Float;
  
  private var scale(default, set): Float;

  public function new(width: Int, height: Int, scene: Scene, scale: Float = 1) {
    super();

    this.gameWidth = width;
    this.gameHeight = height;

    this.changeScene(scene);

    this.canvas = new BitmapData(Std.int(gameWidth / scale), Std.int(gameHeight / scale));
    trace(this.canvas.width, this.canvas.height);
    this.display = new Bitmap(this.canvas);

    this.scale = scale;

    addEventListener(Event.ADDED_TO_STAGE, this.create);
  }

  public function changeScene(scene: Scene) {
    this.scene = scene;
  }

  private function create(_) {
    removeEventListener(Event.ADDED_TO_STAGE, this.create);

    Lib.current.stage.scaleMode = StageScaleMode.EXACT_FIT;

    this.time = Date.now().getTime();
    Meta.keys = new Keys();

    addChild(display);

    addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  private function onEnterFrame(_) {
    var now = Date.now().getTime();

    // This seems to work!
    var dt = (now - this.time) / 100;

    scene.update(dt);
    scene.draw(canvas);

    this.time = now;
  }

  private function set_scale(scale: Float) {
    display.scaleX = scale;
    display.scaleY = scale;

    return this.scale = scale;
  }
}
