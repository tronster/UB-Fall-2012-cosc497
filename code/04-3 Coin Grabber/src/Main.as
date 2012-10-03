package 
{
	import engine.Display;
	import engine.Input;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Keyboard;
	
	
	public class Main extends Sprite 
	{
		private const MAX_COINS :int = 20;
		
		private var coins	: Vector.<Coin>;
		private var player	: Player;
		
		
		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		/// Setup
		private function init( e:Event = null ):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			Display.init( stage );
			Input.init( stage );
			
			// Allocate colleciton of coins
			coins = new Vector.<Coin>();			
			var coin:Coin;
			for ( var i:int = 0; i < MAX_COINS; ++i )
			{
				// Create coin, add it both to our collection an display list.
				coin = new Coin();
				coins.push( coin );				// add to our collection
				Display.main.addChild( coin );	// add to display list
				
				coin.x = Math.random() * stage.stageWidth * 0.8;
				coin.y = Math.random() * stage.stageHeight * 0.8;
			}
			
			// Create player object; add to display list and set starting point
			player = new Player();
			Display.main.addChild( player );
			player.x = stage.stageWidth * 0.5;
			player.y = stage.stageHeight * 0.5;
			
			stage.addEventListener( Event.ENTER_FRAME, update );
		}

		
		private function update( e:Event ):void
		{
			const MOVE_SPEED:int = 15;

			// Check for input
			if ( Input.isDown( Keyboard.LEFT) )		player.x -= MOVE_SPEED; 
			if ( Input.isDown( Keyboard.RIGHT) )	player.x += MOVE_SPEED;
			if ( Input.isDown( Keyboard.UP) )		player.y -= MOVE_SPEED;
			if ( Input.isDown( Keyboard.DOWN) )		player.y += MOVE_SPEED;
			
			// Loop through every coin and check for collision
			// Start at the end of the array since each collision will splice the
			// coin out of the array, which changes the array size.
			var len:int = coins.length - 1;
			for ( var i:int = len; i > -1; --i )
			{
				// Use Flash's built in display-based collision
				if ( player.hitTestObject( coins[i] ) )
				{	
					coins[i].destroy();
					coins.splice( i, 1 );
				}
			}
		}
		
	}
	
}