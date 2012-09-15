package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	

	/// Animate a circle moving a little amount each frame
	public class Main extends Sprite 
	{
		private var frame:int;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener( Event.ENTER_FRAME, onFrame );
		}
		
		private function onFrame( e:Event ):void
		{
			frame++;
			
			graphics.clear();
			graphics.beginFill( 0x00ff00, 0.5 );
			graphics.drawCircle( 200, 150 + (Math.sin( frame * 0.1 ) * 100), 50 );
			graphics.endFill();			
		}
		
	}
	
}