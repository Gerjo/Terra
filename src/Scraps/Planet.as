package {
	import Base.MovingObject;
	public class Planet extends MovingObject {
		private var radius:Number    = 1;
		private var endRadius:Number = 100;
		private var frameCounter:int = 0;
		private var _baseColor:uint  = 0xFFFFFF;
		
		public function Planet(x:int, y:int) {
			super(x, y);
		}
		
		public override function update() : void {
			super.update();
			if (++frameCounter == 2) { 
				frameCounter = 0;
				++radius; 
				drawObject();
			}
		}
		
		public override function drawObject() : void {
			//graphics.clear();
			graphics.beginFill(_baseColor);
			graphics.drawCircle(x, y, radius);
			//graphics.endFill();
		}
		
		public function set baseColor(value:uint) : void {
			this._baseColor = value;
		}
	}
}