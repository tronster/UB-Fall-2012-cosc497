package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import engine.*;
	
	public class Main extends Sprite 
	{
		/// CTOR
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
			State.current = new GameState();
			
			addEventListener( Event.ENTER_FRAME, update );
		}
		
		
		/// Main Game loop
		private function update( e:Event ):void
		{			
			Time.update();
			Input.update();
			State.update();
			
			Systems.console.update();
		}
		
	}
	
}