package engine
{
	import flash.display.Bitmap;
	
	
	public class Actor implements IDisposable
	{
		/// Mostly for debugging (current id )
		private static var _nextId	: uint;
		public var id				: uint;
		
		/// Location
		public var x		: Number;
		public var y		: Number;
		
		/// Dimensions
		public function get width():int 	{ return img.width; }
		public function get height():int	{ return img.height; }
		
		/// Image representing current state/aciton of actor
		public var img		: Bitmap;
		
		/// Toggle actor is displayed / able to be interacted with.
		public var enabled	: Boolean = true;
		
		
		
		
		/**
		 * CTOR
		 * @param	x	Starting horizontal
		 * @param	y	Starting vertical
		 */
		public function Actor( x:Number = -1, y:Number = -1 ) 
		{
			this.x = x;
			this.y = y;
			
			this.id = _nextId;
			_nextId++;
		}
		
		
		/// Pseudo destructor
		public function dispose():void
		{
			img.bitmapData = null;
			img = null;
			x = -2;
			y = -2;
		}
		
		
		public function update():void
		{
			if ( img == null )
				return;
				
			img.x = x;
			img.y = y;
		}
		
		
		/// Is a point colliding with this actor?
		public function isPointCollide(hx:Number,hy:Number) :Boolean
		{
			if ( hy >= y && hy <= (y + height) )
			{
				return ( hx >= x && hx <= (x + width) );
			}
			
			return false;
		}
		
	}

}