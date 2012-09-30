package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	/// Test showing Acionscript's 3 "Dictionary" class
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var dict:Dictionary = new Dictionary();
			
			// key using an integer
			dict[123] = "foo";
			trace( "dict[123] : " + dict[123] );
			
			// key using a string
			dict["something"] = "bar";
			trace( "dict[\"something\"] : " + dict["something"] );
						
			// array key (v1)
			var arr:Array = [12, 34];
			dict[ arr ] = "baz";
			trace( "dict[ arr ] : " + dict[arr] );

			// array key (v2)
			// Note: when tracing this out it's undefined... can you tell why?
			dict[ [56, 78] ] = "qux";
			trace( "dict[ [56, 78] ] : " + dict[ [56, 78] ] );


			
			// list contents of dictionary
			trace("\n--[ CONTENTS ]----------------------");
			for each(var thing:* in dict)
				trace( "values: " + String(thing) );

			// list keys of dictionary	
			trace("\n--[ KEYS ]----------------------");
			for (var key:* in dict ) 
				trace(key + " ( " + getQualifiedClassName(key) + " )");
		}
		
	}
	
}