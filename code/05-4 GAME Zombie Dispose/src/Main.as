package 
{
	import engine.*;
	import flash.display.Sprite;
	import flash.events.Event;
	

	
	public class Main extends Sprite 
	{		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		/**
		 * Initialize sub-systems, set initial state, and kick off game loop
		 */
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			Systems.init( stage );
						
			Global.level = 1;
			State.current = new GameState();
			
			addEventListener( Event.ENTER_FRAME, update );
		}
		
		
		/**
				  Main GAME LOOP!
		  
		          ##          ##
					##      ##
				  ##############
				####  ######  ####
			  ######################
			  ##  ##############  ##
			  ##  ##          ##  ##
					####  ####
		 */
		private function update( e:Event ):void
		{
			Time.update();
			Input.update();
			State.update();
			
			Systems.console.add( String(Time.frameCount) );
		}
		
	}
	
}