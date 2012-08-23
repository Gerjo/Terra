package {
	public class Toolkit {
		public static function random(min:int, max:int) : int {
			return min + (Math.random() * (max + 1 - min));
		}
		
		public static function array_rand(collection:Array) : String {
			return collection[random(0, collection.length-1)].toString();
		}
	}
}