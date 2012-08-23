package {
	import authoring.authObject;
	import flash.display.Sprite;
	import flash.display.*;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.events.Event;
	
	public class ScoreRing extends BaseRing {
		private var scoreDiscs:Array = new Array();
			
		public function ScoreRing(owner:Game) {
			super(owner);
			
			
			// Load the backgrounds:
			sections[0] = new SectionModelScore(ResourcesImages.SCOREBACKGROUND0, 0,   new Point(0, -ResourcesImages.SCOREBACKGROUNDSIZE), 1);
			sections[1] = new SectionModelScore(ResourcesImages.SCOREBACKGROUND1, 90,  new Point(ResourcesImages.SCOREBACKGROUNDSIZE, 0),  2);
			sections[2] = new SectionModelScore(ResourcesImages.SCOREBACKGROUND2, 180, new Point(0,ResourcesImages.SCOREBACKGROUNDSIZE),  3);
			sections[3] = new SectionModelScore(ResourcesImages.SCOREBACKGROUND3, 270, new Point( -ResourcesImages.SCOREBACKGROUNDSIZE, 0), 0);
			
			//loadSections();
			
			scoreDiscs[0] = new ScoreDisc(owner, 0);
			scoreDiscs[1] = new ScoreDisc(owner, 90);
			scoreDiscs[2] = new ScoreDisc(owner, 180);
			scoreDiscs[3] = new ScoreDisc(owner, 270);
			
			for (var i:int = 0; i < scoreDiscs.length; ++i) {
				addChild(scoreDiscs[i]);			
			}
		}
		
		public function setScore(section:int, elementID:int, value:int) : void {
			(scoreDiscs[section] as ScoreDisc).setScore(section, elementID, value);
		}
		
		public function getScore(section:int, elementID:int) : Number {
			return (scoreDiscs[section] as ScoreDisc).getScore(section, elementID);
		}
		
		public function getSectionModelAt(index:int) : SectionModelScore {
			return sections[index];
		}
		
		public function getScoreDiscAt(index:int) : ScoreDisc {
			return (scoreDiscs[index] as ScoreDisc); // To do: add null pointer protection.
		}
		
		public override function update() : void {
			for (var i:int = 0; i < scoreDiscs.length; ++i) {
				scoreDiscs[i].update();
			}
		}
	}
}