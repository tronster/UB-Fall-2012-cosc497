package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	
	/// Show how to move a sprite around with the keyboard.
	/// Use arrow keys to move sprite around
	public class Main extends Sprite 
	{
		private var player:Boxy;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addChild( player = new Boxy() );	// notice allocation & added to the display chain all on the same line

			player.x = 100;
			player.y = 100;
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );			
		}
		
		
		/// Callback when a key is pressed
		private function onKeyDown( e:KeyboardEvent ):void
		{
			switch( e.keyCode )
			{
				case Keyboard.LEFT:	
					player.x -= 10; 
					break;
					
				case Keyboard.RIGHT:
					player.x += 10;
					break;
				
				case Keyboard.UP:
					player.y -= 10;
					break;
				
				case Keyboard.DOWN:
					player.y += 10;
					break;
					
				default:
					trace("Unsupported key code: " + e.keyCode );
					break;
			}
		}
		
	}
	
}