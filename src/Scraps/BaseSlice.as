package  {
	import flash.display.Sprite;
	import flash.display.*;
	import flash.net.URLRequest;
	import flash.events.Event;

	public class BaseSlice extends Sprite {
		private var image:String          = "";
		private var imageWidth:Number     = 1;
		private var imageHeight:Number    = 1;
		private var scale:Number		  = 1;
		private var _angleVelocity:Number = 0;
		
		public function BaseSlice(image:String, imageWidth:Number, imageHeight:Number, scale:Number) {
			this.image       = image;
			this.imageWidth  = imageWidth;
			this.imageHeight = imageHeight;
			this.scale       = scale;
			
			this.x = imageWidth * scale;
			this.y = imageHeight * scale;
			
			var pictLdr:Loader = new Loader();
			var pictURLReq:URLRequest = new URLRequest(image);
			pictLdr.load(pictURLReq);
				
			pictLdr.x = -(imageWidth * (scale / 2));
			pictLdr.y = -(imageHeight * (scale / 2));
			pictLdr.scaleX = scale;
			pictLdr.scaleY = scale;
				
			this.addChild(pictLdr);
		}
		
		public function set angleVelocity(value:Number) : void {
			this._angleVelocity = value;
		}
		
		public function get angleVelocity() : Number {
			return _angleVelocity;
		}
	}
}