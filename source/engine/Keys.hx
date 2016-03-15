package engine;

import openfl.events.KeyboardEvent;
import flash.Lib;

class Keys {
  public var LEFT: Key;
  public var RIGHT: Key;

  public function new() {
    LEFT = new Key();
    RIGHT = new Key();

    Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
    Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
  }
  
  public function keyDown(e: KeyboardEvent) {
    trace("KEY DOWN", e.keyCode);
    if (e.keyCode == 37) {
      LEFT.set(Key.DOWN);
    } else if (e.keyCode == 39) {
      RIGHT.set(Key.DOWN);
    }
  }
  
  public function keyUp(e: KeyboardEvent) {
    trace("KEY UP", e.keyCode);
    if (e.keyCode == 37) {
      LEFT.set(Key.UP);
    } else if (e.keyCode == 39) {
      RIGHT.set(Key.UP);
    }
  }
}

private class Key {
  public static var NEUTRAL = 0;
  public static var UP = 1;
  public static var DOWN = 2;

  private var last: Int;
  private var now: Int;

  public function new() {
    this.last = NEUTRAL;
    this.now = NEUTRAL;
  }

  public function set(status: Int) {
    this.last = this.now;
    this.now = status;
  }
  
  public function isPressed(): Bool {
    return now == DOWN;
  }

  public function justPressed(): Bool {
    return now == DOWN && last == UP;
  }

  public function justReleased(): Bool {
    return now == UP && last == DOWN;
  }
}
