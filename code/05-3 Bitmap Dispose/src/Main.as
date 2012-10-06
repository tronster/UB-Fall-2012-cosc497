package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	
	
	/**
	 * Bitmap Dispose
	 * Demonstrates:	bitmap usage, dispose pattern
	 * 					AS3 memory functions
	 * 
	 * Uses:	+ to add junk
	 * 			- to remove junk
	 * 			spacebar to toggle forced garbage collection
	 */
	public class Main extends Sprite 
	{
		private const FONT_SIZE :int = 18;
		
		private var tf		: TextField;
		private var forceGC	: Boolean = false;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			tf = new TextField();
			tf.defaultTextFormat = new TextFormat("Courier", FONT_SIZE , 0xffff00, true );
			tf.autoSize = TextFieldAutoSize.LEFT;
			addChild( tf );
			realizeMemory();
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
		}
		
		
		private function addJunk() :void
		{
			var junk:JunkImage = new JunkImage();
			junk.x = Math.random() * (stage.stageWidth - junk.width );
			junk.y = Math.random() * (stage.stageHeight - junk.height - FONT_SIZE  ) + FONT_SIZE ;  // don't write over info at top
			stage.addChild( junk );
			
			realizeMemory();
		}
		
		
		private function removeJunk(): void
		{
			// Get the most recently added child on the stage.
			var junk:JunkImage = (stage.getChildAt( stage.numChildren - 1 ) as JunkImage);
			if ( junk != null )
			{
				stage.removeChild( junk );
			}
			else
			{
				trace("Cannot find junk on the stage to remove!");
			}
			
			// Force garbage collection (in debug player only)
			if ( forceGC ) 
				System.gc();
				
			realizeMemory();
		}
		
		
		private function realizeMemory():void
		{
			tf.text = "+ add junk  - remove junk [space] semi-force Garbage collection\n" + String( int(System.totalMemory / 1024 )) + "k";
		}
		
		
		private function onKeyDown( e:KeyboardEvent ):void
		{
			switch( e.keyCode )
			{
				case Keyboard.MINUS: 	removeJunk();		break;
				case Keyboard.EQUAL: 	addJunk();			break;
				case Keyboard.SPACE:	forceGC = !forceGC;	break;	 
			}
		}
	}
	
}