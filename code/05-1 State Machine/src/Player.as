package  
{
	import engine.center;
	import engine.Display;
	import engine.IDisposable;
	import flash.display.Sprite;
	
	
	public class Player implements IDisposable
	{
		private var gfx:Sprite;
		public var x:int;
		public var y:int;
		
		
		/// CTOR
		public function Player() 
		{
			gfx = new Sprite();
			gfx.graphics.beginFill( 0xddaa22 );
			gfx.graphics.drawRect(0, 0, 32, 32);
			gfx.graphics.endFill();
			
			Display.main.addChild( gfx );
			
			// Center graphic, be sure to read back values
			center( gfx );
			x = gfx.x;
			y = gfx.y;
		}
		

		/// @see IDisposable
		public function dispose():void
		{
			if ( gfx != null )
				Display.main.removeChild( gfx );
				
			gfx = null;
			x = -1;
			y = -1;
		}

		public function update():void
		{
			gfx.x = x;
			gfx.y = y;
		}		
				
	}

}