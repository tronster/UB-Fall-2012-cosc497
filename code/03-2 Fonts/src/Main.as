package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	
	/**
	 * Demonstrates how to embed a font in your SWF and utilize it.
	 */
	public class Main extends Sprite 
	{
		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		/// This sprite has a stage, can start being maniuplated...
		private function init( e:Event = null ):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Resources.init();
			
			var tf:TextField = maketf();
			tf.text = "Yay! Embedded font action...";
			addChild( tf );
			
			// increase size of field, by default only a few characters will fit
			tf.width = stage.stageWidth;
			
			// Place the textfield in the center of the screen vertically; since 
			// justification is set to "centered" the text will automatically be
			// horizontally centered.
			tf.x = 0;
			tf.y = (stage.stageHeight * 0.5) - (tf.textHeight * 0.5);
		}
		
		
		
		/// Helper function to generate TF objects properly setup to use
		/// the "MainFont" that has been embedded in this .SWF;
		private function maketf() :TextField
		{
			var tf:TextField 	= new TextField();
			var fmt:TextFormat 	= new TextFormat("MainFont", 62, 0x0 );
			tf.antiAliasType 	= AntiAliasType.ADVANCED;
			tf.embedFonts 		= true;
			fmt.align 			= TextFormatAlign.CENTER;
			tf.defaultTextFormat = fmt;
			
			return tf;
		}
		
	}
	
}