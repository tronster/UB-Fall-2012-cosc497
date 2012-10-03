package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.LocalConnection;
	import flash.system.System;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	public class Main extends Sprite 
	{
		private var strong	:Array;
		private var weak	:Dictionary;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			strong = [];
			weak = new Dictionary( true );
			
			var a:Object = new Object();
			a["myValue"] = 123;
			
			var b:Object = new Object();
			b["myValue"] = 456;
			
			strong[0] 	= a;
			weak[0]		= b;

			stage.addEventListener( MouseEvent.CLICK, onClick);
		}
		
		private function onClick( e:MouseEvent ):void
		{
			trace("--{ " + getTimer() + " ms }----------------");
			trace("STRONG: " + strong[0]["myValue"]	);
			trace("  WEAK: " + weak[0]["myValue"]	);
			
			
			// FLASH hack: Force garabage collection
			try {
				System.gc();
				new LocalConnection().connect('blah');
				new LocalConnection().connect('blah');
			} catch (e:*){
			}			
			
		}
		
	}
	
}