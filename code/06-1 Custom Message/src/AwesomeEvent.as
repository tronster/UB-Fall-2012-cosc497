package  
{
	import flash.events.Event;

	
	public class AwesomeEvent extends Event
	{
		public static const AWESOME_EVENT:String = "awesomeEvent";
		
		private static var next_id:uint = 0;

		public var id				:uint = 0;
		public var secretMessage	:String = "";
		
		
		/// CTOR
		public function AwesomeEvent( msg:String ) 
		{	
			super( AWESOME_EVENT );
			
			id = next_id;
			next_id++;
			
			secretMessage = msg;
		}
		
		/**
		 * Required by the Flash system, as it may potentially, clone the message.
		 * @return
		 */
		override public function clone():Event
		{
			var ae:AwesomeEvent = new AwesomeEvent( this.secretMessage );
			
			return ae;
		}
		
	}

}