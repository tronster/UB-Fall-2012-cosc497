package  
{
	import flash.display.Sprite;

	public class Boxy extends Sprite
	{
		public function Boxy() 
		{
			graphics.lineStyle(2, 0xff0000 );
			graphics.beginFill( 0xffcccc );
			graphics.drawRect( -10, -10, 20, 20 );
			graphics.endFill();
		}	
	}

}