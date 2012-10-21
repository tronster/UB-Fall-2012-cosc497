package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	public class Resources 
	{
		[Embed(source = "../lib/bob.png")]
		private static var _Bob:Class;
		
		public static var Bob:BitmapData;
		
		
		public static function init():void
		{
			Bob = (new _Bob()).bitmapData;
		}
	}

}