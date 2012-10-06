package engine 
{
	import flash.display.Stage;
	import engine.Time;
	
	public class Systems 
	{
		private static var isInit:Boolean = false;
		
		/// Initialize sub-systems in the proper order (and prevent re-initialization).
		static public function init( stage:Stage ):void 
		{
			if ( isInit )
				return;
				
			Time.init( stage );
			Display.init( stage );
			Input.init( stage );
			
			isInit = true;
		}
		
	}

}