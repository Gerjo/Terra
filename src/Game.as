package {
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.events.Event;
	
	public class Game extends Sprite {
		private var scoreRing:ScoreRing;
		private var landRing:LandRing;
		private var crosshairRing:CrosshairRing;
		private var elementRing:ElementRing;
		private var cloudRing:CloudRing;
		private var blueRing:BlueRing;
		private var relicRing:RelicRing;
		private var background:SectionModelSprite;
		
		private var lastLocation:Number = 0;
		private var _ringCenter:Point   = new Point(512, 375);
		private var roundCounter:Number = 0;
		
		private var previewMove:int 	= 0;
		
		private var soundController:SoundController;
		
		private var enableWinAnimation:Boolean = false;
		
		public function Game() {
			scoreRing       = new ScoreRing(this);
			landRing        = new LandRing(this);
			crosshairRing   = new CrosshairRing(this);
			elementRing     = new ElementRing(this);
			cloudRing		= new CloudRing(this);
			blueRing		= new BlueRing(this);
			
			relicRing		= new RelicRing(this);			
			background      = new SectionModelSprite(ResourcesImages.BACKGROUND, 0, new Point(-250, -250));
			
			background.scaleX = background.scaleY = 1.5;
			
			soundController = new SoundController();
			
			addChild(background);
			addChild(relicRing);
			addChild(blueRing);
			addChild(cloudRing);
			
			addChild(landRing);		
			addChild(elementRing);
			addChild(crosshairRing);
			addChild(scoreRing);
			
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		public function onEnterFrame(e:Event) : void {
			landRing.update();
			scoreRing.update();
			crosshairRing.update();
			elementRing.update();
			cloudRing.update();

		}
		
		public function correctCount(count:int) : int {
			switch(count) {
				case 4: return 0;
				case 5: return 1;
				case 6: return 2;
				case 7: return 3;
				default: return count; // intentionally cause a null pointer.

			}
		}
		
		// Game mechanics go here:
		public function onArriveAtLocation(location:Number, commit:Boolean = false) : void {
			
			
			var winScore:int = 0;
			getSoundController().stopRotate();
			
			if (enableWinAnimation) return;
			
			previewMove = 0;
			//if (commit) previewMove = 0;
			//if (!commit) return; 
			
			++roundCounter;
			lastLocation = location;
						
			// Increment the appropriate element scores:
			for (var i:int = 0; i < 4; ++i) {
				if (elementRing.getElementCodeAt(i) == 0) continue; // skip shadow
				var newScore:Number = scoreRing.getScore(correctCount(location + i), elementRing.getElementCodeAt(i)-1) + 1;
				if (newScore > 3) { continue; };
				scoreRing.setScore(correctCount(location + i), elementRing.getElementCodeAt(i)-1, newScore);
			}
			
			// The 'negative' round:
			if (roundCounter % 3 == 0) {
				trace("negatief");
				
				var defeats:Array = new Array();
				defeats[0] = 0;
				defeats[1] = 3;
				defeats[2] = 1;
				defeats[3] = 2;
				
				for (var j:int = 0; j < 4; ++j) {
					var tempElement:Number = elementRing.getElementCodeAt(j);
					if (tempElement == 0) continue; // skip shadow
					var score:int = scoreRing.getScore(correctCount(location + j), defeats[tempElement] - 1) - 1;
					//trace("At section " + j + " sits element " + tempElement + ". This beats element " + defeats[tempElement] + " newScore:" + score);
					if (score < 0) continue;
					scoreRing.setScore(correctCount(location + j), defeats[tempElement] - 1, score);
				}
				
			}
			
			//if (roundCounter % 4 == 0) {
			//	elementRing.randomsizeElements();
			//}
			
			// Find the lowest value and paint the center land pieces:
			for (var k:int = 0; k < 4; ++k) { // Mind we use variable j due to a bug in the compiler.
				var lowestScore:int = scoreRing.getScoreDiscAt(k).getLowestScore();
				if (lowestScore == 3) winScore++;
				landRing.setLandPiece(k, lowestScore);
			}
			
			if (winScore == 4) {
				enableWinAnimation = true;
				addChild(new SectionModelSprite(ResourcesImages.YOUWON, 0, new Point(140, -ResourcesImages.YOUWONSIZE)));
				trace("you won.");
			}
		}
		
		public function onKeyDown(e:KeyboardEvent) : void {
			//trace(e.keyCode);
			switch(e.keyCode) {
				case 82: // cheat
					if(!elementRing.isRotating()) {
						trace("swap sun / shadow");
						elementRing.swapElements();
					}
					break;
				case 84: // cheat
					if(!elementRing.isRotating()) {
						trace("randomize");
						elementRing.randomsizeElements();
					}
					break;
				case 69: // cheat
					if(!elementRing.isRotating()) {
						trace("Power up ding!");
						roundCounter = 0;
					}
					break;
				case 16:
					if(!elementRing.isRotating()) {
						trace("Stay at location");
						onArriveAtLocation(lastLocation);
					}
					break;
				case 32:
					onArriveAtLocation(lastLocation, true);
					trace("LOCK!");
					break;
				case 37:
					if (!elementRing.isRotating() && !enableWinAnimation) {
						if(previewMove > -1) {
						
							elementRing.rotateLeft();
							getSoundController().startRotate();
							previewMove--;
						} else {
							trace("right preview limit reached.");
						}
					}
					break;
				case 39:
					if (!elementRing.isRotating() && !enableWinAnimation) {
						if(previewMove < 1) {
							
							elementRing.rotateRight();
							getSoundController().startRotate();
							previewMove++;
						} else {
							trace("left preview limit reached.");
						}
					}
					break;
			}
			
			//trace(previewMove);
		}
		
		public function get ringCenter() : Point {
			return _ringCenter;
		}
		
		public function getSoundController() : SoundController {
			return soundController;
		}
		
		public function isEnableWinAnimation() : Boolean {
			return enableWinAnimation;
		}
	}
}