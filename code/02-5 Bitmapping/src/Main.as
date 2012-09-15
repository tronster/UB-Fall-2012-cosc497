package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * Show off the bitmap type; closest 2d draw type to other platforms (XNA, DirectX, etc...)
	 */
	public class Main extends Sprite 
	{
		private var data	:BitmapData;
		private var click	:int = 0;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// While bitmap is the container (and what is added to the display list), the 
			// actual pixels are manipulated in the BitmapData.
			var bitmap:Bitmap = new Bitmap();
			data = new BitmapData( 256, 256, false, 0x0 );
			
			bitmap.bitmapData = data;
			addChild(bitmap);
			bitmap.x = 64;
			bitmap.y = 123;
			
			stage.addEventListener( MouseEvent.CLICK, onClick );
			stage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
		}
		
		/// Change the contents of the bitmap data every the mouse is clicked
		private function onClick( e:MouseEvent ):void
		{	
			// Increment click; loop back to 0 if hitting max
			click++;
			if (click > 6 )
				click = 0;
			
			// Perform different action on data based on click #.
			switch( click )
			{
				case 0:	data.fillRect( data.rect, 0x0 );		 			break;
				case 1: data.fillRect( data.rect, 0xff00ff00 );				break;
				case 2: data.noise( 123 );									break;
				case 3: data.noise( 123, 0, 99 );							break;
				case 4: data.noise( 123, 0, 255, 7, true );					break;
				case 5: data.perlinNoise( 256, 256, 3, 123, false, false );	break;
				case 6: data.perlinNoise(32, 32,13, 123, false, false );	break;
			}
		}
		
		
		/// Change background color of this entire sprite base on the pixel the
		/// mouse is hovering over.
		public function onMouseMove( e:MouseEvent ):void
		{
			var pixel:uint = data.getPixel( e.localX, e.localY );
			
			graphics.clear();
			graphics.beginFill( pixel, 1 );
			graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight );
			graphics.endFill();
		}
	}
	
}