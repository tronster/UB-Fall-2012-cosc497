package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/// Draw a red circle via native Flash/AS3 vector calls
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
			
			graphics.beginFill( 0xff0000 );
			graphics.drawCircle(300, 200, 50 );
			graphics.endFill();
		}
		
	}
	
}