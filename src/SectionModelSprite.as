package {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.events.Event;
	
	public class SectionModelSprite extends Sprite {
		private var _imageURL:String     = "";
		private var _angleOffset:Number  = 0;
		private var _posOffset:Point;
		private var sprite:DisplayObject = null;
		private var spriteLoader:Loader  = new Loader();
		private var lastUsedURL:String   = null;
		
		public function SectionModelSprite(_imageURL:String, _angleOffset:Number, _posOffset:Point) : void {
			this._imageURL    = _imageURL;
			this._angleOffset = _angleOffset;
			this._posOffset   = _posOffset;
			
			loadSprite(_imageURL);
		}
		
		public function loadSprite(url:String) : void {
			if (lastUsedURL == url) return;
			lastUsedURL = url;
			
			var spriteURLReq:URLRequest = new URLRequest(url);
			//var oldSprite:Loader 		= spriteLoader; 
			
			spriteLoader = new Loader();
			spriteLoader.load(spriteURLReq);
				
			spriteLoader.x = posOffset.x;
			spriteLoader.y = posOffset.y;
				
			spriteLoader.rotation = angleOffset;
			
			if (sprite != null) removeChild(sprite);
			//removeChild(sprite);
			
			addChild(spriteLoader);
			
			sprite = spriteLoader;
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