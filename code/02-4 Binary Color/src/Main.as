package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Demonstrate drawing by create colors through a helper, non-class function rgb()
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
			
			// Draw yellow rectangle at the top
			graphics.beginFill( rgb(0xff, 0xff, 0x0), 1 );
			graphics.drawRect(0, 0, stage.stageWidth, 100 );
			graphics.endFill();
			
			// Draw a purple rectangle near the bottom
			var purple:uint = rgb(0xff, 0x0, 0xff);
			graphics.beginFill( purple, 1 );
			graphics.drawRect(0, 350, stage.stageWidth, 100 );
			graphics.endFill();
		}
		
	}
	
}