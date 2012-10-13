package  
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import engine.*;
	

	public class Enemy extends Sprite
	{
		
		public function Enemy() 
		{
			var g:Graphics = this.graphics;
			g.beginFill( 0xff0000 );
			g.drawRect( 0, 0, 20 + (Math.random() * 20), 10 + (Math.random() * 30));
			g.endFill();
		}
		
		
		public function dispose():void
		{
			Global.world.removeEnemy( this );
			graphics.clear();
		}
		
		
		public function update() :void
		{
			this.x -= Global.world.SPEED * Time.deltaTime;
			if ( this.x + this.width < 0 )
				dispose();
				
			if ( this.hitTestObject( Global.player ) )
			{
				Global.player.die();
				Global.world.gameOver();
				dispose();
			}
		}
	}

}