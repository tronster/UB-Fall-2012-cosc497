package 
{
	import engine.*;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * Show how loop invarient code can be moved outside of a for statement
	 * in order to save computation time.
	 * 
	 * Computation is faking out some hit point calculating for enemies.
	 */
	public class Main extends Sprite 
	{
		private const MAX_TESTS		: int = 100;
		private const MAX_ENEMIES	: int = 30000;

		private var durrationA	: uint;
		private var durrationB	: uint;
		
		
		/// CTOR - entry
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			Systems.init( stage );
			addEventListener( Event.ENTER_FRAME, update );
		}
		
		
		private function update( e:Event ):void
		{
			Time.update();
			
			switch( Time.frameCount )
			{
				case 1 : 
					out("About to start!"); 
					break;
					
				case 10: 
					out("Starting phat loop..."); 
					phatLoop(); 
					out("phat result: " + durrationA + " ms");
					break;
					
				case 20:
					out("Starting good loop...");
					goodLoop();
					out("good result: " + durrationB + " ms");
					break;
				
				case 30:
					out("");
					out("DIFF: " + (durrationA - durrationB) + " ms");
					break;
				default: break;
			}
		}
		
		
		private function phatLoop():void
		{
			var testLoop:int;
			var start	: uint;
			var end		:uint;
			var enemies	:Vector.<Object>;
			
			enemies = new Vector.<Object>( MAX_ENEMIES );

			var hp		:int = 123;
			var baseHp	:int = 10;
			var armor	:int = 10;
			var i		:int;
			
			
			start = getTimer();
			for ( testLoop = 0; testLoop < MAX_TESTS; testLoop++ )
			{	
				
				// The loop!
				for ( i = 0; i < MAX_ENEMIES; i++ )
				{
					expensiveCall();
					hp = baseHp + armor;
					enemies[i] = new Object();
					enemies[i]["hp"] = hp; 
				}

				
				
			} // END testLoop
			end = getTimer();
			durrationA = end - start;
		}
			
			
		private function goodLoop():void
		{
			var testLoop:int;
			var start	: uint;
			var end		:uint;
			var enemies	:Vector.<Object>;
			
			enemies = new Vector.<Object>( MAX_ENEMIES );
			
			
			var hp		:int = 123;
			var baseHp	:int = 10;
			var armor	:int = 10;
			var i		:int;

			start = getTimer();
			for ( testLoop = 0; testLoop < MAX_TESTS; testLoop++ )
			{				
				
				
				// The loop, notice the computation is moved outside!s
				hp = baseHp + armor;
				expensiveCall();				
				for ( i = 0; i < MAX_ENEMIES; i++ )
				{
					enemies[i] = new Object();
					enemies[i]["hp"] = hp;  
				}
				
				
				
				
			} // END testLoop
			
			end = getTimer();
			durrationB = end - start;
		}
		
		
		
		private function expensiveCall():void
		{
			var a:int = 5;
			var s:String = "";
			s = String(a);
			s.indexOf("asdfasdfasdf");
			s += String(a);
		}
		
		
	}
	
}