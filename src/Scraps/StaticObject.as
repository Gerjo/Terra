package Base {
	import flash.display.Sprite;
	
	public class StaticObject extends Sprite {
		private var _placeVector:Vector2D;
		
		public function StaticObject(x:Number, y:Number) {
			this.x 	    = x;
			this.y	    = y;
			drawObject();
		}
		
		// To be overriden:
		public function drawObject() : void {
		
		}

		public function get placeVector() : Vector2D {
			return new Vector2D(x, y);
		}
		public function set placeVector(value:Vector2D) : void {
			this.x = value.x;
			this.y = value.y;
		}
	}
}