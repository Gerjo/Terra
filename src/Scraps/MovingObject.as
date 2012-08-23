package Base {
	public class MovingObject extends StaticObject{	
		private var _velocity:Vector2D  = new Vector2D(0, 0);
		private var _drag:Vector2D		= new Vector2D(0, 0);
		
		public function MovingObject(x:Number, y:Number) {
			super(x, y);
		}	
		
		// Ready to override:
		public function update() : void {
			x += _velocity.x;
			y += _velocity.y;
		}
		
		public function set velocity(value:Vector2D) : void {
			this._velocity = value;
		}
	}
}