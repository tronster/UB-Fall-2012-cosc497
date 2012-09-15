package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

	/// Draw the "Hello World!" to the screen and debug Output
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
			
			var tf:TextField = new TextField();
			tf.text = "Hello World!";
			addChild(tf);
			
			trace( tf.text );
		}
	}
	
}