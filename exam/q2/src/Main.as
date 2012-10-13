package 
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import engine.*;
	

	/**
	 * Q2.	Make this game run properly.
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
			
			var global:Global = new Global();
			
			Systems.init( stage );
			
			Global.world 		= new World( this );
			Global.player		= new Player();
			
			Global.player.x 	= Display.width * 0.25;
			Global.player.y 	= Display.height * 0.5;
		
			Global.world.draw();
			Display.main.addChild( Global.player );
		
			addEventListener( Event.ENTER_FRAME, update );
		}
	
		
		// logic update
		private function update():void
		{	
			Time.update();
			Input.update();
			
			Global.world.update();			
			Global.player.update();
		}
		
		public function gameOver():void
		{
			removeEventListener( Event.ENTER_FRAME, update);
		}
		
	}
	
}