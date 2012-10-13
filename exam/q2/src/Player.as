package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	import engine.*;

	
	public class Player extends Bitmap
	{
		private static const SPEED 			: Number = 300.0;
		private static const JUMP_MAX_MS	: uint = 600;
		
		private static const STATE_RUNNING		: uint = 0;
		private static const STATE_JUMPING		: uint = 1;
		private static const STATE_DOUBLEJUMPING: uint = 2;
		private static const STATE_LANDING		: uint = 3;
		private static const STATE_DEAD			: uint = 4;
				
		public var state:uint = STATE_RUNNING;
		
		private var jumpStart:uint = 0;
		
		public function get isJumping():Boolean { return ( state != STATE_RUNNING ); }
		
		
		/// CTOR
		public function Player() 
		{
			// Draw once
			var s:Sprite = new Sprite();
			var g:Graphics = s.graphics;
			g.beginFill( 0xffff00 );
			g.drawCircle(0, 0, 16);
			g.endFill();
			g.beginFill( 0x009944 );
			g.drawCircle( -2, -3, 3 );
			g.drawCircle( 8, -3, 3 );
			g.endFill();
			g.beginFill( 0x000000 );
			g.moveTo( -5, 5 );
			g.curveTo(0, 17, 9, 5);
			g.endFill();
			
			// Rasterize into bitmap data
			var matrix:Matrix = new Matrix(1, 0, 0, 1, 16, 16 );
			bitmapData = new BitmapData( 32, 32, true, 0x0 );
			bitmapData.draw( s, matrix );	
		}
		
		
		
		public function update():void
		{
			var delta:Number = Time.deltaTime;
			
			
			if ( state == STATE_DEAD )
				return;
			
			if ( state == STATE_JUMPING || state == STATE_DOUBLEJUMPING )
			{	
				var now:uint = getTimer();
				var jumpTime:int = now - jumpStart;
				
				if ( jumpTime > JUMP_MAX_MS )
					state = STATE_LANDING;
				else if ( jumpTime > (JUMP_MAX_MS * 0.8 ))
					this.y -= ( delta * (SPEED * 0.5) );
				else if ( jumpTime > (JUMP_MAX_MS * 0.5 ))
					this.y -= ( delta * (SPEED * 0.75) );
				else 
					this.y -= ( delta * SPEED );
			}
			else //if ( state == STATE_LANDING )
			{
				this.y += (delta * SPEED );
			}
			
			var v:Vector3D = Global.world.isColliding( this );
			if ( v.length > 0 )
			{
				this.x += v.x;
				this.y += v.y;
				state = STATE_RUNNING;
			}
			
			// Space to jump
			if ( state == STATE_JUMPING && Input.getKeyDown( Keyboard.SPACE ) )
			{
				state = STATE_DOUBLEJUMPING;
				jumpStart = getTimer();
			}

			// Space to jump
			if ( state == STATE_RUNNING && Input.getKeyDown( Keyboard.SPACE ) )
			{
				state = STATE_JUMPING;
				jumpStart = getTimer();
			}
			
			
		}
		
		public function die():void
		{
			state = STATE_DEAD;
		}
	}

}