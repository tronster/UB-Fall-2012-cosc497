package  
{
	import flash.display.Sprite;
	
	public class HappyDude extends Sprite
	{
		/// CTOR
		public function HappyDude() 
		{
			graphics.beginFill( 0xffff00 );
			graphics.drawCircle(0, 0, 30);
			graphics.endFill();
			
			graphics.beginFill( 0xcc9977 );
			graphics.drawCircle( -10, -10, 8 );
			graphics.drawCircle( 10, -10, 8 );
			graphics.endFill();	
			
			graphics.lineStyle(4, 0xcc9977 );
			graphics.moveTo( -15, 5 );
			graphics.lineTo( -10, 15 );
			graphics.lineTo( 0, 20 );
			graphics.lineTo( 10, 15 );
			graphics.lineTo( 15, 5 );
		}		
	}
}