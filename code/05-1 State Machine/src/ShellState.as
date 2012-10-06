package  
{
	import engine.*;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	
	
	public class ShellState implements IState
	{
		/// CTOR
		public function ShellState() 
		{		
		}
		
		
		/// @see IState
		public function start():void
		{
			var tf		:TextField;
			
			tf = maketf();
			tf.text = "Main Menu";
			tf.y = 10;
			Display.ui.addChild( tf );
		
			
			var button	:Sprite;	// temporary variable, re-used in composing buttons
						
			button = makeButton("Play", clickPlay );
			Display.ui.addChild( button );
			button.x = 5;
			button.y = 150;
			
			button = makeButton("Scores", clickScores );
			Display.ui.addChild( button );
			button.x = 5;
			button.y = 250;
		}
		
		/// @see IState
		public function update():void
		{
		}
		
		
		/// @see IState
		public function end():void
		{
			Display.clear();
		}
		
		
		public function clickPlay( button:ButtonPure ):void
		{
			trace("ShellState: play");

			State.current = new GameState();
			// WARNING: Be aware that end() was just called on this state!
		}

		
		public function clickScores( button:ButtonPure ):void
		{
			trace("ShellState: scores");
			
			State.current = new LeaderboardState();
			// WARNING: Be aware that end() was just called on this state!
		}
		
	}

}