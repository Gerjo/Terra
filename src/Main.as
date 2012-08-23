package {
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class Main extends Sprite {
		
		public function Main() : void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null) : void {	
			//stage.frameRate = 1000;
			var game:Game = new Game();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, game.onKeyDown);
			addChild(game);
		}
	}
}