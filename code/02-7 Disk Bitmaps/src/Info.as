package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * Displays informational message at the bottom of the screen.
	 */
	public class Info extends Sprite
	{
		private var tf :TextField;
		
		
		/// CTOR
		public function Info() 
		{			
			tf = new TextField();
			tf.defaultTextFormat = 
				new TextFormat(
					"Arial", 32, 0x0, null, null, null, null, null, TextFormatAlign.CENTER );
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			tf.width = stage.stageWidth;
			tf.height = 42;
			tf.background = true;
			tf.backgroundColor = 0xffffff;
			tf.y = stage.stageHeight - tf.height;

			addChild( tf );
		}
		
		public function set text( s:String ):void
		{
			tf.text = s;
		}
		
	}

}