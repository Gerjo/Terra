package  {
	import flash.geom.Point;
	
	public class RelicRing extends BaseRing {
		public function RelicRing(owner:Game) {
			super(owner);
			
			sections[0] = new SectionModel(ResourcesImages.RELICRING, 0,   new Point(-ResourcesImages.RELICRINGSIZE, -ResourcesImages.RELICRINGSIZE));
			
			loadSections();
		}
		
		public override function update() : void {
			//rotation += 0.05;
		}
	}
}