package {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class SoundController {
		
		private var soundChannel:SoundChannel;
		[Embed(source = 'music/RotatingDiscsLong.mp3')]
		private var soundClass:Class;
		private var sound:Sound;
		
		private var soundChannel2:SoundChannel;
		[Embed(source = 'music/MilySymphFull1.mp3')]
		private var soundClass2:Class;
		private var sound2:Sound;
		
		
		public function SoundController() {
			sound = new soundClass();
			sound2 = new soundClass2();
			
			startBackgroundMusic();
		}
		
		public function startBackgroundMusic() : void {
			soundChannel2 = sound2.play(0, 100);
		}
		public function stopBackgroundMusic() : void {
			soundChannel2 = sound2.play(0, 100);
		}
		
		public function startRotate() : void {
			soundChannel = sound.play(0, 1);
		}
		
		public function stopRotate() : void {
			try {
				soundChannel.stop();
			} catch(e:Error) { }
		}
	}
}