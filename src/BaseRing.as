package {
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.events.Event;
	
	public class BaseRing extends Sprite {
		protected var indicators:Array = new Array();
		protected var sections:Array   = new Array();
		protected var sprites:Array    = new Array();
		protected var owner:Game;
		
		public function BaseRing(owner:Game) {
			this.owner = owner;
			x 	       = owner.ringCenter.x;
			y 		   = owner.ringCenter.y;
		}
		
		public function loadIndicators() : void {
			for (var i:int = 0; i < indicators.length; ++i) {
				addChild(indicators[i]);
			}
		}
		
		// DEPRICATED
		public function loadSections() : void {
			for (var i:int = 0; i < sections.length; ++i) {
				var section:SectionModel  = sections[i];
				var pictLdr:Loader        = new Loader();
				var pictURLReq:URLRequest = new URLRequest(section.imageURL);
				pictLdr.load(pictURLReq);
				pictLdr.x = section.posOffset.x;
				pictLdr.y = section.posOffset.y;
				pictLdr.rotation = section.angleOffset;
				addChild(pictLdr);
				sprites[i] = pictLdr;
			}
		}	
		
		// To be overriden:
		public function update() : void {
			
		}
		
		// Remap the angle to a 0..360 range, rather than -180..180
		public function getAngle() : Number {
			return (rotation < 0) ? (180 - Math.abs(rotation)) + 180 : rotation;
		}
		
		public function setAngle(value:Number) : void {
			rotation = value;
		}
		
		public function getSections() : Array {
			return sections;
		}
	}
}