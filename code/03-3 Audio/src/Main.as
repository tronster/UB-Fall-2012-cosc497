package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.media.SoundMixer;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	/**
	 * How to get audio to work in FlashDevelop.
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Even though this static function does nothing (in this code) it's likely
			// some resource intialization will occur when you make a game.
			Resources.init();
			
			var tf:TextField = new TextField();
			tf.width = 200;
			tf.wordWrap = true;
			tf.text = "AUDIO TEST\n\nSPACEBAR - stop all sounds\nM - play music\nE - play sound effect";
			addChild( tf );
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown );
		}
		
		private function onKeyDown( e:KeyboardEvent ):void
		{
			switch( e.keyCode )
			{
				case Keyboard.SPACE:
					stopSounds();
					break;
					
				case Keyboard.M:
					playMusic();
					break;
					
				case Keyboard.E:
					playEffect();
					break;
			}
		}
		
		private function stopSounds():void 
		{
			SoundMixer.stopAll();
		}
		
		private function playMusic():void
		{
			var snd:Sound = new Resources.MusicTrack1();
			snd.play(0, 99999);
		}

		private function playEffect():void
		{
			var snd:Sound = new Resources.StuffSound();
			snd.play();
		}

	}
	
}