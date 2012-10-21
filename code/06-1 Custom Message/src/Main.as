package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	
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
			
			addEventListener( AwesomeEvent.AWESOME_EVENT, onAwesome );
			addEventListener( AwesomeEvent.AWESOME_EVENT, onMoreAwesome );

			var ae:AwesomeEvent = new AwesomeEvent( "I am awesome!");
			dispatchEvent( ae );
			dispatchEvent( new AwesomeEvent( "That's right, I'm a message master!") );
		}
		
		public function onAwesome( e:AwesomeEvent ):void
		{
			trace("    onAwesome received #" + e.id + " msg: " + e.secretMessage );
		}

		public function onMoreAwesome( e:AwesomeEvent ):void
		{
			trace("onMoreAwesome received #" + e.id + " msg: " + e.secretMessage );
		}

	}	
}