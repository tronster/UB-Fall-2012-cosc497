package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	
	/**
	 * Once you master binary arrays, you can read and write ANYTHING!
	 */
	public class Main extends Sprite 
	{
		private var bytes:ByteArray;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			bytes = new ByteArray();
			bytes.writeInt( 321 );			//  4 bytes
			bytes.writeBoolean( true );		// +1 byte  = 5 bytes
			bytes.writeBoolean( false );	// +1 byte  = 6 bytes
			bytes.writeFloat( 567.89 );		// +4 bytes = 10 bytes
			
			// Show how many bytes have currently been written to the byte array
			trace("lengh: " + bytes.length );
			
			
			// Set the read/write "head" back to the start of the stream.
			bytes.position = 0;
			
			var i:int;
			var b:Boolean;
			var f:Number;
			
			var i:int = bytes.readInt();
			trace("#1: " + i );
			
			b = bytes.readBoolean();
			trace("#2: " + b );
			
			b = bytes.readBoolean();
			trace("#3: " + b );
			
			f = bytes.readFloat();
			trace("#4: " + f );		// that isn't quite what was put in it!
		}
		
	}
	
}