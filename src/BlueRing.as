package  {
	import flash.geom.Point;
	
	public class BlueRing extends BaseRing {
		public function BlueRing(owner:Game) {
			super(owner);
			
			sections[0] = new SectionModel(ResourcesImages.BLUERING, 0,   new Point(-ResourcesImages.BLUERINGSIZE, -ResourcesImages.BLUERINGSIZE));
			
			loadSections();
		}
		
		public override function update() : void {
			//rotation += 0.05;
		}
	}
}