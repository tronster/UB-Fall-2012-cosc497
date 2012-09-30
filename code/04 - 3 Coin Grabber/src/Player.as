package  
{
	import flash.display.Sprite;
	
	public class Player extends Sprite
	{
		
		public function Player() 
		{
			graphics.beginFill( 0x7700aa );
			graphics.lineStyle( 2, 0xdd00ee );
			graphics.drawRoundRect( -16, -16, 32, 32, 18, 18 );
			graphics.endFill();
		}
		
	}

}