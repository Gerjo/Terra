package  
{
	import flash.display.Bitmap;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	/**
	 * ...
	 * @author Melvin
	 */
	public class AudioSample extends Sprite
	{
		[Embed(source = 'Images/Raarding.png')]
		private var badbitchClass:Class;
		private var badbitch:Bitmap = new badbitchClass();
		private var soundChannel:SoundChannel;
		
		[Embed(source = 'Sounds/Tutorial.mp3')]
		private var soundClass:Class;
		private var sound:Sound;
		
		public function BadBitch() 
		{
			addChild(badbitch);
			x = 200;
			y = 555;
			sound = new soundClass();
			soundChannel = sound.play(0, 1);
		}
		
	}

}