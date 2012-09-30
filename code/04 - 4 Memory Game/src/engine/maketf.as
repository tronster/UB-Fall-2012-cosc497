package engine
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	

	/// Helper function that makes a textfield for a consisent style throughout program.
	/// Utilizes a font that should be setup else-where (resources).
	public function maketf( size:int = 32 ):TextField
	{
		var tf:TextField = new TextField();			
		tf.defaultTextFormat 		= new TextFormat("MainFont", size, 0xffffff, true );
		tf.defaultTextFormat.align 	= TextFormatAlign.CENTER;
		
		tf.embedFonts   = true;
		tf.autoSize 	= TextFieldAutoSize.CENTER;
		tf.y 			= size * 0.5;
		tf.mouseEnabled = false;
		
		return tf;
	}
}