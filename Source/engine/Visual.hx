package engine;

import openfl.display.BitmapData;
import openfl.geom.Point;


class Visual extends Base {
  public var x(get, set):Float;
  public var y(get, set):Float;

  private var data: BitmapData;
  private var position: Point;

  public function new(x: Int=0, y: Int=0) {
    super();

    this.position = new Point(x, y);

    this.data = openfl.Assets.getBitmapData("assets/detective.png");
  }

  override public function update(dt: Float): Void {
    this.x += 1;
    trace("moving");
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
