package engine;

import openfl.display.BitmapData;
import openfl.geom.Rectangle;
import openfl.geom.Point;

class Tile {
  public var index: Int;
  
  public function new(i: Int) {
    this.index = i;
  }
}

class Tilemap extends Visual {
  private var map: Array<Array<Tile>>;

  public var mapWidth: Int;
  public var mapHeight: Int;

  private var tilesize: Int;

  public function new(x: Int, y: Int, tiles: Array<Array<Int>>, tileset: BitmapData, tilesize: Int = 16) {
    super(x, y, tileset);

    this.tilesize = tilesize;

    mapWidth = tiles[0].length;
    mapHeight = tiles.length;
  
    map = new Array<Array<Tile>>();

    for (row in tiles) {
      var newRow = new Array<Tile>();
      for (tile in row) {
        newRow.push(new Tile(tile));
      }

      map.push(newRow);
    }
  }

  override public function draw(canvas: BitmapData) {
    for (y in 0...mapHeight) {
      for (x in 0...mapWidth) {
        var tile = map[y][x];
  
        // Skip blank tiles
        if (tile.index == 0) {
          continue;
        }

        var source = new Rectangle(tile.index * tilesize, 0, tilesize, tilesize);
        var dest = new Point(this.x + (x * tilesize), this.y + (y * tilesize));

        canvas.copyPixels(
            data,
            source,
            dest
            );
      }
    }
  }
}
