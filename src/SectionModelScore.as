package {
	import flash.geom.Point;	
	
	public class SectionModelScore extends SectionModel {
		protected var _scoreSun:Number      = 1; // 1
		protected var _scoreAir:Number      = 1; // 2
		protected var _scoreWater:Number    = 1; // 3
		protected var _elementID:Number     = -1; // Corresponds to a land piece in the center.
		
		public function SectionModelScore(_imageURL:String, _angleOffset:Number, _posOffset:Point, _elementID:Number) {
			super(_imageURL, _angleOffset, _posOffset);
			
			this._elementID = _elementID;
		}
		
		public function incrementAllByOne() : void {
			_scoreSun++;
			_scoreAir++;
			_scoreWater++;
		}
		
		public function get elementID() : Number {
			return _elementID; // Corresponds to a land piece in the center.
		}
		public function get scoreSun() : Number {
			return _scoreSun; // 1
		}
		public function get scoreAir() : Number {
			return _scoreAir; // 2
		}
		public function get scoreWater() : Number {
			return _scoreWater; // 3
		}
		
		public function getLowestScore() : Number {
			return Math.min(scoreSun, scoreAir, scoreWater);
		}
		
		public function traceScore() : void {
			trace("[" + this.elementID + "] Sun: " + this.scoreSun + ", Air:" + this.scoreAir + ", Water:" + this.scoreWater);
		}
	}
}