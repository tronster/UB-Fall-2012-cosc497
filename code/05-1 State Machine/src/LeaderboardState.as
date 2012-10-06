package  
{
	import engine.ButtonPure;
	import engine.Display;
	import engine.IState;
	import engine.makeButton;
	import engine.maketf;
	import engine.State;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class LeaderboardState implements IState
	{
		/// CTOR
		public function LeaderboardState() 
		{		
		}

		
		/// @see IState		
		public function start():void
		{
			var tf		:TextField;
			
			tf = maketf();
			tf.text = "Leaderboards";
			tf.y = 10;
			Display.ui.addChild( tf );
		
			var button :Sprite = makeButton("Back", clickBack );
			Display.ui.addChild( button );
			button.x = 5;
			button.y = Display.height - 50;
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
		
		
		private function clickBack( button:ButtonPure ):void
		{
			trace("LeaderboardState: back");
			State.current = new ShellState();
		}
		
	}

}