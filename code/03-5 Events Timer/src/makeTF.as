package  
{
	import flash.text.TextField;
	import flash.text.TextFormat;
		
	function makeTF( defaultValue:String = "" ) :TextField
	{
		var tf:TextField = new TextField();
		tf.width = 100;
		tf.height = 50;
		tf.defaultTextFormat = new TextFormat( "Arial", 32, 0xffff00 );
		tf.text = defaultValue;
		
		return tf;
	}

}