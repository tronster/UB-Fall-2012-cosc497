package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	/**
	 * Generates a junk filled bitmap
	 */
	public class JunkImage extends Bitmap implements IDisposable
	{	
		public function JunkImage() 
		{
			bitmapData = new BitmapData( 256, 256, true, 0x0 );
			bitmapData.lock();
			bitmapData.perlinNoise( 256, 256, 8, Math.random() * 999, false, false );
			bitmapData.unlock();
		}
		
		public function dispose() :void
		{
			bitmapData.dispose();
			bitmapData = null;
		}
	}

}