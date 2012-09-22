package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.getTimer;
	import flash.utils.Timer;

	
	/// Demonstrate using a timer to move a sprite vs a sprite moved via frame delta
	/// Set frame rate by clicking on the stage; left = 1 FPS, right = 60 FPS
	public class Main extends Sprite 
	{
		private const DELAY_MS	: int = 33;

		private var lastTime	: int;
		private var timer		: Timer;
		private var starTimer	: Star;
		private var starFrame	: Star;
		private var tf			: TextField;
		
		
		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init( e:Event = null ):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// frame rate counter
			tf = makeTF("30")
			addChild( tf );

			// Create a star the is manually controller by the timer
			starTimer = new Star( 0xff4444 );
			addChild( starTimer );
			starTimer.y = stage.stageHeight * 0.3;

			// Create a star that will be controller by Flash's update frame.
			starFrame = new Star( 0x4444ff);
			addChild( starFrame );
			starFrame.y = stage.stageHeight * 0.6;
			
			lastTime = getTimer();
			
			timer = new Timer( DELAY_MS );
			timer.addEventListener( TimerEvent.TIMER, fixedUpdate );
			timer.start();
			
			stage.addEventListener( Event.ENTER_FRAME, update );

			stage.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			stage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
		}
		
		/// Guaranteed to be called based on tick
		private function fixedUpdate( e:TimerEvent ):void
		{
			var currentTime	: int = getTimer();
			
			// get ratio and move
			var delta 		: Number  = (currentTime - lastTime) / DELAY_MS;
			starTimer.x += (2 * delta);

			// screen wrap
			if (starTimer.x - (starTimer.width * 0.5) > stage.stageWidth )
				starTimer.x -= (stage.stageWidth + (starTimer.width * 0.5));
			
			lastTime = currentTime;
		}
		
		/// Call is made base on frame rate
		private function update( e:Event ):void
		{
			// the important stuff; moves it
			starFrame.x += 2;
			
			// screen wrapping
			if (starFrame.x - (starFrame.width*0.5) > stage.stageWidth )
			{
				starFrame.x -= (stage.stageWidth + (starFrame.width*0.5));
			}
		}
		
		/// Change frame speed (FPS) base on where the mouse is clicked (left = slower, right = faster)
		private function onMouseDown( e:MouseEvent ):void
		{
			stage.frameRate = (e.stageX / (stage.stageWidth * 0.5)) * 30;
			tf.text = String( int(stage.frameRate) );
		}
		
		private function onMouseUp( e:MouseEvent ):void
		{
			stage.frameRate = 30;
			tf.text = String( int(stage.frameRate) );
		}		
	}
	
}