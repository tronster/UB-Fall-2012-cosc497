package  
{
	import flash.display.Graphics;
	import flash.ui.Keyboard;
	import utils.Display;
	import utils.Input;

	
	/**
	 * ...
	 */
	public class Player 
	{
		public var x			: Number = 0;
		public var y			: Number = 0;		
		public var halfWidth	: Number = 30;
		public var halfHeight	: Number = 30;
		public var color		: uint = 0xff0000;

		
		/// CTOR
		public function Player() 
		{
			// Start player 75% of the way across the screen and
			// half way (50%) down the screen.
			
			x = Display.width * 0.75;
			y = Display.height * 0.5;
		}
		
		
		
		public function update():void
		{
			// Check input if movement should occur.
			if ( Input.isDown( Keyboard.DOWN ) ) 	y += 10;
			if ( Input.isDown( Keyboard.UP ) ) 		y -= 10;
			if ( Input.isDown( Keyboard.LEFT ) )	x -= 10;
			if ( Input.isDown( Keyboard.RIGHT ) )	x += 10;
			
			// Change color
			if ( Input.isDown( Keyboard.Z ) )		color = 0xff0000;
			if ( Input.isDown( Keyboard.X ) )		color = 0x0000ff;
			
			// Draw self into graphics
			var graphics:Graphics = Display.game.graphics;
			graphics.lineStyle( 2, 0x0 );
			graphics.beginFill( color );
			graphics.drawRect( x - halfWidth, y - halfHeight, halfWidth * 2, halfHeight * 2);			
			graphics.endFill();
			
		}
		
		
		/// Simple AABB collision 
		public function isColliding( enemy:Enemy ) :Boolean
		{			
			// First check horizontal...
			var length	: Number = halfWidth + enemy.halfWidth;	// minimum distance between centers before collision
			var diff	: Number = Math.abs( x - enemy.x);		// actual distance between centers
			
			if ( diff < length )
			{
				// Horizon is overlapping, now check vertical.
				
				length 	= halfHeight + enemy.halfHeight;
				diff	= Math.abs( y - enemy.y );
				
				// If vertically shorter, there is collision
				if ( diff < length )
					return true;
			}
			
			return false;
		}
		
	}

}