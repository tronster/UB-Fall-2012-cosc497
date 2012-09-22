package 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundMixer;
	
	
	/**
	 * Demonstrates how to bring assets in that exported from a Flash SWC
	 */
	public class Main extends Sprite 
	{
		/// Keep track when sound is playing to prevent layering due to multi-triggering.
		private var isPlaying:Boolean = false;
		
		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Add a movie clip.
			var mc:MovieClip = new Ball();
			addChild( mc );
			mc.x = stage.stageWidth * 0.5;
			mc.y = stage.stageHeight * 0.5;
			
			// Add an image.
			var image:Bitmap = new Bitmap( new Block() );
			addChild( image );
			
			// Setup listeners to start/stop sound
			mc.addEventListener( MouseEvent.MOUSE_OVER, onBall_MouseOver );
			mc.addEventListener( MouseEvent.MOUSE_OUT, onBall_MouseOut );
		}
		
		
		// Play sound when the mouse is over the bounching ball.
		private function onBall_MouseOver( e:MouseEvent ):void
		{
			if ( isPlaying )
				return;
			
			var sound:Sound = new MusicTrack1();
			sound.play();
			
			isPlaying = true;
		}
		
		// Stop all sound when the mouse isn't over the ball.
		private function onBall_MouseOut( e:MouseEvent ):void 
		{
			SoundMixer.stopAll();
			isPlaying = false;
		}
		
	}
	
}