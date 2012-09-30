package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Coin extends Sprite
	{	
		private var isDestroyed:Boolean = false;
		
		/// CTOR
		public function Coin() 
		{
			// Create graphics for coin; note this has no idea about
			// where or what place it has on the display chain, this object
			// just cares about drawing into it self and let's something else
			// higher up handle where it is placed.
			graphics.beginFill( 0xffff50 );
			graphics.drawEllipse( -8, -16, 16, 32 );
			graphics.endFill();
			
			addEventListener( Event.ENTER_FRAME, update );
		}
		
		
		private function update( e:Event ):void 
		{
			rotationY += 5;
			
			// If this coin has been marked for destruction,
			// play out an animation
			if ( isDestroyed )
			{
				// scale up and alpha out
				scaleX = scaleY += 0.2;
				alpha -= 0.1;
				
				if ( scaleX > 3.0 )
				{
					// Scale is so big...
					
					// stop updating every frame 
					removeEventListener( Event.ENTER_FRAME, update );
					
					// Remove from whatever parent is holding this
					if ( parent != null)
						parent.removeChild( this );
				}
			}
		}
		
		
		public function destroy(): void
		{
			isDestroyed = true;
		}
	}

}