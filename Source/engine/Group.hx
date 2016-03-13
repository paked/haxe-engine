package engine;

import openfl.display.BitmapData;

class Group extends Base {
  private var members: Array<Base>;

  public function new() {
    super();

    members = new Array<Base>();
  }

  public function add(v: Visual) {
    members.push(v);
  }

  override public function update(dt: Float) {
    super.update(dt);

    for (m in members) {
      m.update(dt);
    }
  }

  override public function draw(display: BitmapData) {
    super.draw(display);

    for (m in members) {
      m.draw(display);
    }
  }
}
