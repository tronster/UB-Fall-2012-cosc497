package engine 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	
	
	/**
	 *	Input Manager
	 */
	public class Input 
	{
		static private const UP		:uint = 0;
		static private const DOWN	:uint = 1;
		
		static private var keys:Array;
		
		
		static public function init( stage:Stage ):void 
		{
			keys = []; // this is a shortcut for typing new Array(255);
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
			stage.addEventListener( KeyboardEvent.KEY_UP, 	onKeyUp );
		}
		
		static public function onKeyDown( e:KeyboardEvent ):void
		{
			keys[ e.keyCode ] = DOWN;
		}
		
		static public function onKeyUp( e:KeyboardEvent ):void
		{
			keys[ e.keyCode ] = UP;
		}
		
		static public function isDown( code:uint ):Boolean
		{
			return keys[ code ] == DOWN;
		}
	}

}