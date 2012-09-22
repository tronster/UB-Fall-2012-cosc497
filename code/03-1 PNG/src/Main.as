package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author tronster
	 */
	public class Main extends Sprite 
	{
		// Auto generated in FD by right-click the bitmap in the "Project"
		// view and selecting "Generate Embed Code"
		[Embed(source = "../lib/trolling.png")]
		private var Trolling:Class;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var bitmap:Bitmap = new Trolling();
			addChild ( bitmap );
		}
		
	}
}
