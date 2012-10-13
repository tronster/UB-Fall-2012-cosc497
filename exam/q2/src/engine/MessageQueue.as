package engine 
{
	/**
	 * Handles process messages, including order added.
	 */
	public class MessageQueue 
	{
		private static var queue:Vector.<Message>;
		
		/// Static CTOR
		{
			queue = new Vector.<Message>();
		}
		
		public static function add( msg:Message ):void
		{
			queue.push( msg );
		}
		
		/// Clear ALL messages in the queue.
		public static function clear():void
		{
			queue = new Vector.<Message>();
		}
		
		/// Return the next message to process or NULL if none.
		public static function get():Message 
		{
			/// If no messages, return null
			if (queue.length < 1) 
				return null;
			
			var removedItems: Vector.<Message> = queue.splice(0, 1);	// remove first item in list
			var msg			: Message = removedItems[0];				// since previous call returns Vector, get first item

			return msg;
		}
	}

}