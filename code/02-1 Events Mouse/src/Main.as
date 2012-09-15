package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/// Move an object around based on the mouse position.
	public class Main extends Sprite 
	{
		private var happyDude :HappyDude;
		
		public function Main():void 
		{			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			happyDude = new HappyDude();
			addChild( happyDude );
			
			stage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
		}
		
		private function onMouseMove( e:MouseEvent ):void
		{
			happyDude.x = e.stageX;
			happyDude.y = e.stageY;
		}
	}
	
}