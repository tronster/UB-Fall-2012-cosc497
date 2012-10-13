package engine 
{
	import flash.display.Stage;
	import engine.Time;
	
	public class Systems 
	{
		private static var isInit	: Boolean = false;
	
		public static var console	: Console;
		public static var actors	: ActorManager;
		
		
		/// Initialize sub-systems in the proper order (and prevent re-initialization).
		static public function init( stage:Stage ):void 
		{
			if ( isInit )
				return;
				
			Time.init( stage );
			Display.init( stage );
			Input.init( stage );
			
			console = Console.getInstance();
			actors	= new ActorManager();
			
			isInit = true;
		}
		
		
	}

}