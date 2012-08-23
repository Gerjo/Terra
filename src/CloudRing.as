package  {
	import flash.geom.Point;
	
	public class CloudRing extends BaseRing {
		public function CloudRing(owner:Game) {
			super(owner);
			
			sections[0] = new SectionModel(ResourcesImages.CLOUDS, 0,   new Point(-ResourcesImages.CLOUDSIZE, -ResourcesImages.CLOUDSIZE));
			
			loadSections();
		}
		
		public override function update() : void {
			rotation += 0.05;
		}
	}
}