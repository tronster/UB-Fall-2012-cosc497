package  
{
	import engine.center;
	import engine.Display;
	import engine.Input;
	import engine.IState;
	import engine.maketf;
	import engine.State;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	public class GameState implements IState
	{
		private var player:Player;
		
		/// CTOR
		public function GameState() 
		{		
		}
		
		/// @see IState
		public function start():void
		{
			var tf:TextField = maketf( 16 );
			tf.text = "Press ESC to quit";
			tf.y = 10;
			Display.ui.addChild( tf );
			
			player = new Player();
		}
		
		/// @see IState
		public function update():void
		{			
			const SPEED:int = 10;

			if ( Input.getKeyDown( Keyboard.ESCAPE ) )
			{
				State.current = new ShellState();
				return;	// bail early because the state is no longer valid!
			}
			
			
			if ( Input.getKey( Keyboard.LEFT ) )	player.x -= SPEED;
			if ( Input.getKey( Keyboard.RIGHT ) )	player.x += SPEED;
			if ( Input.getKey( Keyboard.UP ) )		player.y -= SPEED;
			if ( Input.getKey( Keyboard.DOWN ) )	player.y += SPEED;
			
			player.update();
		}
		
		
		/// @see IState
		public function end():void
		{
			player.dispose();
			
			Display.clear();
		}
		
	}

}