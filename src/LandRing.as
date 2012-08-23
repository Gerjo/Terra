package {
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class LandRing extends BaseRing {
		private var landFileNames:Array = new Array();
		
		
		public function LandRing(owner:Game) {
			landFileNames[0] = ResourcesImages.LAND0;
			landFileNames[1] = ResourcesImages.LAND1;
			landFileNames[2] = ResourcesImages.LAND2;
			landFileNames[3] = ResourcesImages.LAND3;
			
			super(owner);
			indicators[0] = new SectionModelSprite(landFileNames[1], 0,   new Point(0, -ResourcesImages.LANDSIZE));
			indicators[1] = new SectionModelSprite(landFileNames[1], 90,  new Point(ResourcesImages.LANDSIZE, 0));
			indicators[2] = new SectionModelSprite(landFileNames[1], 180, new Point(0, ResourcesImages.LANDSIZE));
			indicators[3] = new SectionModelSprite(landFileNames[1], 270, new Point( -ResourcesImages.LANDSIZE, 0));
			loadIndicators();
		}
		
		public function setLandPiece(index:int, newLand:int) : void {
			(indicators[index] as SectionModelSprite).loadSprite(landFileNames[newLand]);
		}
		
		public override function update() : void {
			if (owner.isEnableWinAnimation()) {
				rotation++;
			}
			/*for (var i:int = 0; i < indicators.length; ++i) {
				if(Toolkit.random(1,120) == 5) {
					(indicators[i] as SectionModelSprite).loadSprite("c:/game/" + Toolkit.array_rand(["aarde", "flourishing", "deadish"]) + "_small.png");
				}
			}*/
			//rotation++;
		}

	}
}