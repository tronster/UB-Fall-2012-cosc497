package  
{
	import flash.display.Sprite;
	
	
	public class Particle extends Sprite
	{
		public var life	: int;		
		
		/// CTOR
		function Particle()
		{
			graphics.beginFill( 0xffff00, 0.8 );
			graphics.drawCircle( 0, 0, 4 );
			graphics.endFill();
		}
	}

}