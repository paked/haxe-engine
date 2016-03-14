package engine;

import openfl.display.BitmapData;
import openfl.geom.Point;
import openfl.Assets;

class Visual extends Base {
  public var x(get, set):Float;
  public var y(get, set):Float;

  private var data: BitmapData;
  private var position: Point;

  public function new(x: Int=0, y: Int=0, graphic: BitmapData) {
    super();

    this.position = new Point(x, y);

    this.data = graphic;
  }

  override public function update(dt: Float): Void {
    var xDiff = 10 * dt;

    if (Meta.keys.LEFT.isPressed()) {
      this.x -= xDiff;
    }

    if (Meta.keys.RIGHT.isPressed()) {
      this.x += xDiff;
    }
  }

  override public function draw(display: BitmapData): Void {
    display.copyPixels(
        this.data,
        this.data.rect,
        this.position
        );
  }

  private function get_x() {
    return this.position.x;
  }

  private function set_x(x: Float) {
    return this.position.x = x;
  }

  private function get_y() {
    return this.position.y;
  }

  private function set_y(y: Float) {
    return this.position.y = y;
  }
}
