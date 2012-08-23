package {
	import flash.geom.Point;
	import flash.media.Sound;
	
	public class SectionModel {
		private var _imageURL:String     = "";
		private var _angleOffset:Number  = 0;
		private var _posOffset:Point;
		
		public function SectionModel(_imageURL:String, _angleOffset:Number, _posOffset:Point) : void {
			this._imageURL    = _imageURL;
			this._angleOffset = _angleOffset;
			this._posOffset   = _posOffset;
		}
		
		public function get imageURL() : String {
			return _imageURL;
		}
		
		public function get angleOffset() : Number {
			return _angleOffset;
		}
		
		public function get posOffset() : Point {
			return _posOffset;
		}
	}
}