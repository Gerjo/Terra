package  {
	import flash.geom.Point;
	
	public class CrosshairRing extends BaseRing {
		public function CrosshairRing(owner:Game) {
			super(owner);
			
			sections[0] = new SectionModel(ResourcesImages.CROSSHAIR, 0,   new Point(-ResourcesImages.CROSSHAIRSIZE, -ResourcesImages.CROSSHAIRSIZE)	);
			
			loadSections();
		}
		
		public override function update() : void {
			if (owner.isEnableWinAnimation()) {
				rotation++;
			}
		}
	}
}