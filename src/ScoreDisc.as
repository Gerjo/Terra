package  {
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class ScoreDisc extends BaseRing {
		private var scores:Array     = new Array();
		
		public function ScoreDisc(owner:Game, angle:Number) {
			super(owner);
			
			x = 0;
			y = 0;
						
			// Set the default scores on each of the elements:
			scores[0]     = 1;
			scores[1]     = 1;
			scores[2]     = 1;
			
			//indicators[0] = new SectionModelSprite(ResourcesImages.SCOREINDICATORS[0], 0, new Point(30, -280));
			//indicators[1] = new SectionModelSprite(ResourcesImages.SCOREINDICATORS[1], 0, new Point(150, -200));
			//indicators[2] = new SectionModelSprite(ResourcesImages.SCOREINDICATORS[2], 0, new Point(200, -100));
			
			//trace(ResourcesImages.SCOREFINAL[1][1]);
			
			indicators[0] = new SectionModelSprite(ResourcesImages.SCOREFINAL[0][scores[0]], 0, new Point(0, -375));
			indicators[1] = new SectionModelSprite(ResourcesImages.SCOREFINAL[1][scores[1]], 0, new Point(0, -375));
			indicators[2] = new SectionModelSprite(ResourcesImages.SCOREFINAL[2][scores[2]], 0, new Point(0, -375));
			
			loadIndicators();
			
			rotation = angle;
			//trace("done loading score disc");
		}
		
		public function setScore(section:int, elementID:int, value:int) : void {
			scores[elementID] = value;
			//(indicators[elementID] as SectionModelSprite).loadSprite("c:/game/score" + value + ".png");
			//trace("element:" + elementID + " score:" + scores[value] + " value:" + value + " url" + ResourcesImages.SCOREFINAL[elementID][scores[value]]);
			(indicators[elementID] as SectionModelSprite).loadSprite(ResourcesImages.SCOREFINAL[elementID][value]);
		}
		
		public function getScore(section:int, elementID:int) : Number {
			return scores[elementID];
		}
		
		public function getLowestScore() : Number {
			return Math.min(scores[0], scores[1], scores[2]);
		}
		
		public override function update() : void {
			//(indicators[0] as SectionModelSprite).rotation++;
			//(indicators[0] as SectionModelSprite).loadSprite("c:/game/score" + Toolkit.random(0, 4) + ".png");
			//(indicators[1] as SectionModelSprite).loadSprite("c:/game/score" + Toolkit.random(0, 4) + ".png");
			//(indicators[2] as SectionModelSprite).loadSprite("c:/game/score" + Toolkit.random(0, 4) + ".png");
		}

	}
}