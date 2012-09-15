package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author tronster
	 */
	public class Main extends Sprite 
	{
		private var enemy1:Sprite;
		private var enemy2:Sprite;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			enemy1 = new Sprite();
			enemy1.name = "ms. red";
			enemy1.graphics.beginFill( 0xff0000 );
			enemy1.graphics.drawRect(0, 0, 100, 100);
			enemy1.graphics.endFill();
			addChild( enemy1 );
			
			enemy2 = new Sprite();
			enemy2.name = "mr. blue";
			enemy2.graphics.beginFill( 0x0000ff );
			enemy2.graphics.drawRect(0, 0, 30, 30);
			enemy2.graphics.endFill();			
			enemy1.addChild( enemy2 );
			
			enemy1.x = 200;
			enemy1.y = 200;
			
			enemy2.x = 50;
			enemy2.y = 50;
			enemy2.rotation = 22;
			
			// Uncomment to see more display chain API in action
			doMoreStuff();
		}
		
		private function doMoreStuff():void
		{
			var s:Sprite = enemy1.getChildAt(0) as Sprite;
			trace("s == " + s );
			trace("s.name == " + s.name );
			
			enemy1.removeChild( s );
			stage.addChild( s );
			
		}
		
	}
	
}