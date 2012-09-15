package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	/// Create a bitmap, write it to disk in our format and read it back out
	public class Main extends Sprite 
	{
		private var info	:Info;
		private var step	:int = 0;
		private var image	:Bitmap;
		private var file	:FileReference;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			info = new Info();
			addChild( info );

			info.text = "Click to generate image.";
			
			stage.addEventListener( MouseEvent.CLICK, onClick );
		}
		
		private function onClick( e:MouseEvent ):void
		{
			step++;
			
			switch ( step )
			{
				case 1:	
					buildImage();
					info.text = "Now click to save image to disk.";
					break;
					
				case 2:
					saveImage();
					removeChild( image );
					info.text = "Click again to load the image from disk.";
					break;
					
				case 3:
					loadImage();
					break;
					
				case 4:
					buildImageThatIsTrippy();
					info.text = "Click to save trippy image!";
					break;
				
				case 5:
					saveImage();
					removeChild( image );
					info.text = "Click to load trippy image!";
					break;
					
				case 6:
					loadImage();
					break;
			}
		}
		
		
		/// Create a single, single colored image
		private function buildImage():void
		{
			image = new Bitmap();
			image.bitmapData = new BitmapData( 256, 64, true, 0xff778899 );
			
			addChild( image );
			center( image );
		}
		

		/// Create an image with craziness
		private function buildImageThatIsTrippy():void
		{
			image.bitmapData = new BitmapData( 256, 64, true, 0xff00000 );
			image.bitmapData.perlinNoise( 256, 64, 7, 321, false, false );			
		}

		
		// ------------------------------------------------------
		//	Saving
		
		private function saveImage():void
		{
			var file		:FileReference = new FileReference();
			var bytes		:ByteArray = new ByteArray();
			var signature	:String = "Foo";
			var data		:BitmapData = image.bitmapData;
			
			// Write header, width and height
			bytes.writeUTFBytes( signature );
			bytes.writeInt( data.width );
			bytes.writeInt( data.height );
			
			// Obtain the pixels of the image in another byte array
			var region		:Rectangle = new Rectangle(0, 0, data.width, data.height);
			var pixelData	:ByteArray = data.getPixels( region );

			// Write out pixels to the file byte array
			bytes.writeBytes( pixelData );
			
			// Flush bytes to disk
			file.addEventListener( Event.COMPLETE, onCompleteSave, false, 0, true );
			file.save( bytes, "test.foo" );
		}
		
		private function onCompleteSave( e:Event ):void
		{
			var file:FileReference = e.currentTarget as FileReference;
			file = null;
		}
		
		
		
		// ------------------------------------------------------
		//	Loading part 1 - select
		
		
		private function loadImage():void
		{
			const FILE_TYPES:Array = [new FileFilter("Foo File", "*.foo")];	
			
			file = new FileReference();
			file.addEventListener( Event.SELECT, onSelect, false, 0, true );
			file.browse( FILE_TYPES );
		}
		
		private function onSelect( e:Event ):void
		{
			file.addEventListener(Event.COMPLETE, onLoadComplete, false, 0, true);
			file.addEventListener(IOErrorEvent.IO_ERROR, onError );
			file.load();
		}
		
		private function onError( e:IOErrorEvent ):void 
		{
			info.text = e.text;
		}		
		
		
		// ------------------------------------------------------
		//	Loading part 2 - complete
		
		
		private function onLoadComplete( e:Event ):void
		{
			// Obtain blog of bytes from the raised event
			var bytes	:ByteArray = (e.target.data as ByteArray);
		
			// Make sure file has enough bytes to be considered valid
			if ( bytes.bytesAvailable < 11 )
			{
				info.text = "File size " + bytes.bytesAvailable + " too few!";
				return;
			}
			
			// Make sure signature matches
			var signature:String = bytes.readUTFBytes( 3 );
			if ( signature != "Foo" )
			{
				info.text = "Signature wrong: " + signature;
				return;
			}
			
			// read in dimensions
			var w:uint = bytes.readUnsignedInt();
			var h:uint = bytes.readUnsignedInt();

			// generate a new bitmap using above dimensions
			image.bitmapData = new BitmapData( w, h, true, 0x0 );
			image.bitmapData.setPixels( image.bitmapData.rect, bytes );
			
			// Add and center image
			addChild( image );
			center( image );
			
			info.text = "yay!";
		}
	}
	
	
}