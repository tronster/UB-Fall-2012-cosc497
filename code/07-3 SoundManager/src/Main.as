package 
{
	import engine.out;
	import engine.Systems;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	
	/// Demonstrate how a simple sound manager class works.
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
			
			Resources.init();
			Systems.init( stage );
			
			out("1 to play music");
			out("2 to play sound");
			out("space to stop everything");
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, onKey );
		}
		
		private function onKey( e:KeyboardEvent ):void 
		{
			switch( e.keyCode )
			{
				case Keyboard.NUMBER_1:		Systems.sound.play( Resources.MusicTrack1 );	break;
				case Keyboard.NUMBER_2:		Systems.sound.play( Resources.stuff );			break;
				case Keyboard.SPACE:		Systems.sound.stop();							break;
				
				default:
					break;

			}
			
		}
		
	}
	
}