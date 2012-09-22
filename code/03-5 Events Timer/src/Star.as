package  
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Star extends Sprite
	{
		private var vertices:Vector.<Number> = 
			Vector.<Number>([
				0, -50, 40, 20, -40, 20,
				0, 50, 40, -20, -40, -20
			]);
		
		
		/// CTOR
		public function Star( color:uint ) 
		{
			super();
			graphics.beginFill( color, 0.5);
			graphics.drawTriangles( vertices );
			graphics.endFill();
		}
		
	}

}