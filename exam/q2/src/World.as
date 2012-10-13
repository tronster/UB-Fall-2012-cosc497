package  
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.geom.Vector3D;
	import engine.*;
	import flash.utils.getTimer;
	
	
	public class World 
	{
		public const SPEED		:int = 120;
		
		private var FLOOR_Y		:int;	// psuedo const
		private var enemies		:Vector.<Enemy>;
		private var main		:Main;
		private var lastSpawn	:uint;
		
		/// CTOR
		public function World( main:Main ) 
		{
			this.main = main;
			
			FLOOR_Y = Display.height - 100;
		}
		
		
		public function isColliding( obj:DisplayObject ) :Boolean
		{
			var v:Vector3D = new Vector3D();
			
			if ( (obj.y + obj.height) > FLOOR_Y )
				v.y = (FLOOR_Y - (obj.y + obj.height));
				
			return v;
		}
		
		
		public function draw():void
		{
			var g:Graphics = Display.bg.graphics;
			g.clear();
			g.beginFill(0x223344, 1);
			g.drawRect(0, FLOOR_Y, Display.width, Display.height - FLOOR_Y );
			g.endFill();
		}
		
	
		public function update() :void
		{
			for (var i:int = enemies.length - 1; i >= 0; i-- )
				enemies[i].update();
				
			if ( (Math.random() < 0.001) || enemies.length == 0 || (getTimer() - lastSpawn > 5000) )
			{
				lastSpawn = getTimer();
				spawnEnemy();
			}
		}
		
		private function spawnEnemy() :void
		{
			var enemy:Enemy = new Enemy();

			Display.main.addChild( enemy );
			enemy.x = Display.width;
			enemy.y = FLOOR_Y - enemy.height;
			
			enemies.push( enemy );
		}
		
		public function removeEnemy( enemy:Enemy ) :void
		{
			var idx:int = enemies.indexOf( enemy );
			enemies.splice( idx, 1 );
		}
		
		public function gameOver():void
		{
			main.gameOver();
		}
	}

}