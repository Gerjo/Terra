package {
	public class ResourcesImages {
		public static var BASE_SRC:String = "images/";// "c:/game/";
		
		public static var BACKGROUND:String = BASE_SRC + "background.png"; // game wallpaper
		
		public static var LANDSIZE:int = 200;
		public static var LAND0:String = BASE_SRC + "deadish_small.png";
		public static var LAND1:String = BASE_SRC + "savannah_small.png";
		public static var LAND2:String = BASE_SRC + "aarde_small.png";
		public static var LAND3:String = BASE_SRC + "flourishing_small.png";
		
		public static var ELEMENTSIZE:int = 375;
		public static var ELEMENT0:String = BASE_SRC + "element_regen.png"; // shadow
		public static var ELEMENT1:String = BASE_SRC + "element_lucht.png"; // sun
		public static var ELEMENT2:String = BASE_SRC + "element_zon.png"; // wind
		public static var ELEMENT3:String = BASE_SRC + "element_maan.png"; // water
		
		public static var SCOREBACKGROUNDSIZE:int = 300;
		public static var SCOREBACKGROUND0:String = BASE_SRC + "element1.png"; // shadow
		public static var SCOREBACKGROUND1:String = BASE_SRC + "element2.png"; // sun
		public static var SCOREBACKGROUND2:String = BASE_SRC + "element3.png"; // wind
		public static var SCOREBACKGROUND3:String = BASE_SRC + "element4.png"; // water
		
		public static var CROSSHAIRSIZE:int = 375;
		public static var CROSSHAIR:String  = BASE_SRC + "kruis_small.png"; // Center crosshair (does not rotate)
		
		public static var CLOUDSIZE:int = 250;
		public static var CLOUDS:String = BASE_SRC + "clouds_small.png"; 
		
		public static var BLUERINGSIZE:int = 375;
		public static var BLUERING:String  = BASE_SRC + "bluering.png";
		
		public static var RELICRINGSIZE:int = 375;
		public static var RELICRING:String  = BASE_SRC + "relic.png";
		
		public static var CIRCLEELEMENTSIZE:int = 375;
		public static var CIRCLEELEMENT:String  = BASE_SRC + "circle_element.png";
		
		public static var YOUWONSIZE:int = 0;
		public static var YOUWON:String  = BASE_SRC + "youwon.png";
		
		// Obsolete:
		public static var SCOREINDICATORS:Array = [
			BASE_SRC + "score0.png",
			BASE_SRC + "score1.png",
			BASE_SRC + "score2.png",
			BASE_SRC + "score3.png"];
			
		public static var SCOREFINAL:Array = 
		[
		 //["", "", "" , ""], // shadow
		 [BASE_SRC + "zon_1.png", BASE_SRC + "zon_2.png", BASE_SRC + "zon_3.png" , BASE_SRC + "zon_4.png"], // Sun
		 [BASE_SRC + "lucht_1.png", BASE_SRC + "lucht_2.png", BASE_SRC + "lucht_3.png" , BASE_SRC + "lucht_4.png"], // Air
		 [BASE_SRC + "regen_1.png", BASE_SRC + "regen_2.png", BASE_SRC + "regen_3.png" , BASE_SRC + "regen_4.png"] // Water
		]
		// Obsolete:
		public static var SCOREFANCY:Array = [
			BASE_SRC + "bar45.png",
			BASE_SRC + "bar.png",
			BASE_SRC + "bar.png",
			BASE_SRC + "transparent.png"];

	}
}