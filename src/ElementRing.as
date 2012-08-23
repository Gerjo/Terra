package {
	import flash.geom.Point;
	
	public class ElementRing extends BaseRing {
		private var currentPosition:Number	= 0;
		private var newPosition:Number		= 0;
		private var elementCode:Array		= new Array();
		private var elementFileNames:Array  = new Array();
		
		public function ElementRing(owner:Game) {
			super(owner);
			
			addChild(new SectionModelSprite(ResourcesImages.CIRCLEELEMENT, 0, new Point(-ResourcesImages.CIRCLEELEMENTSIZE, -ResourcesImages.CIRCLEELEMENTSIZE)));
			
			/*elementFileNames[0] = ResourcesImages.ELEMENT0; // shadow
			elementFileNames[1] = ResourcesImages.ELEMENT1; // sun
			elementFileNames[2] = ResourcesImages.ELEMENT2; // wind
			elementFileNames[3] = ResourcesImages.ELEMENT3; // water */
			
			elementFileNames[0] = ResourcesImages.ELEMENT3; // shadow
			elementFileNames[1] = ResourcesImages.ELEMENT2; // sun
			elementFileNames[2] = ResourcesImages.ELEMENT1; // wind
			elementFileNames[3] = ResourcesImages.ELEMENT0; // water
			
			
			elementCode[0] = 1;
			elementCode[1] = 3;
			elementCode[2] = 0;
			elementCode[3] = 2;
			
			/*elementCode[0] = 0;
			elementCode[1] = 1;
			elementCode[2] = 2;
			elementCode[3] = 3;*/
			
			indicators[0] = new SectionModelSprite(elementFileNames[elementCode[0]], 0,   new Point(0, -ResourcesImages.ELEMENTSIZE));
			indicators[1] = new SectionModelSprite(elementFileNames[elementCode[1]], 90,  new Point(ResourcesImages.ELEMENTSIZE, 0));
			indicators[2] = new SectionModelSprite(elementFileNames[elementCode[2]], 180, new Point(0, ResourcesImages.ELEMENTSIZE));
			indicators[3] = new SectionModelSprite(elementFileNames[elementCode[3]], 270, new Point(-ResourcesImages.ELEMENTSIZE, 0));
			
			
			
			loadIndicators();
		}
		
		public override function update() : void {
			if(!owner.isEnableWinAnimation()) {
				if(currentPosition != newPosition || getAngle() != indicators[newPosition].angleOffset) {
					var difference:Number = getAngle() - indicators[newPosition].angleOffset;
					
					if (difference == 0) {
						currentPosition = newPosition;
						
						// Call the owner and execute some game machanics:
						owner.onArriveAtLocation(newPosition);
						return;
					}
					
					if ((difference > -180 && difference < 0) || difference > 180) {
						rotation += 9; // ++;// 
					} else {
						rotation -= 9;
					}
					
					//trace("target:" + sections[newPosition].angleOffset + " current:" + getAngle() + " difference:" + difference);
				}
			}
			if (owner.isEnableWinAnimation()) {
				rotation++;
			}
		}
		
		public function rotateRight() : void {
			//rotation++;
			//direction = "l";
			if (++newPosition >= 4) newPosition = 0;
			
			//trace("Currently on:" + currentPosition + ". Moving to:" + newPosition);
		}
		
		public function rotateLeft() : void {
			//rotation--;
			if (--newPosition < 0) newPosition = 3;
		}
		
		public function reloadElementImages() : void {
			for (var i:int = 0; i < 4; ++i) {
				//trace(elementFileNames[elementCode[i]]);
				(indicators[i] as SectionModelSprite).loadSprite( elementFileNames[elementCode[i]] );
			}
		}
		
		public function randomsizeElements() : void {
			var options:Array = new Array(0, 1, 2, 3);
			
			var newElements:Array = [];
 
			while (options.length > 0) {
				newElements.push(options.splice(Math.round(Math.random() * (options.length - 1)), 1)[0]);
			}
			
			elementCode = newElements;
			reloadElementImages();
			//trace("1234567");
		}
		
		public function getElementCodeAt(index:Number) : Number {
			return elementCode[index]; // Add nullpointer protection
		}
		
		public function getCurrentPosition() : Number {
			return currentPosition;
		}
		
		public function getNewPosition() : Number {
			return newPosition;
		}
		
		public function isRotating() : Boolean {
			return !(currentPosition == newPosition);
		}
		
		public function swapElements() : void {
			var buffer0:int = elementCode[0].toString();
			var buffer1:int = elementCode[1].toString();
			var buffer2:int = elementCode[2].toString();
			var buffer3:int = elementCode[3].toString();
			
			elementCode[0] = buffer2;
			elementCode[1] = buffer1;
			elementCode[2] = buffer0;
			elementCode[3] = buffer3;
			reloadElementImages();
		}
	}
}