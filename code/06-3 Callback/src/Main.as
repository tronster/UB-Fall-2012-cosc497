package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	
	public class Main extends Sprite 
	{
		private var callback:Function;
		private var click:int = 0;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
		}
		
		private function onKeyDown( e:KeyboardEvent ):void
		{
			click++;
			
			if ( click & 1 )
				callback = amazingStuffYo;
			else
				callback = differentAmazingWord;
				
			callback.call( this );
		}
		
		private function amazingStuffYo():void
		{
			graphics.beginFill( Math.random() * 0xffffff );
			graphics.drawRect(0, 0, 300, 300 );
			graphics.endFill();
		}
		
		private function differentAmazingWord():void
		{
			graphics.lineStyle( 2, Math.random() * 0xffffff, 0.5 );
			for (var i:int = 0; i < 100; i++)
			{
				graphics.moveTo( Math.random() * 300,Math.random() * 300 );
				graphics.lineTo( Math.random() * 300,Math.random() * 300 );
			}			
		}
	}
	
}