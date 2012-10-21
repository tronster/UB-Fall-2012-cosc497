package engine 
{
	/// Base class for all messages
	public class Message 
	{
		/// A number that represents which "type" of message this is
		/// for a given game.  Each game will have it's own list of types.
		public var type	:uint;
		
		/// Who send the message.  0 = system, 1 = player 1, etc...
		public var who	:uint;	

		
		/// CTOR
		public function Message( type:uint, who:uint ):void 
		{
			this.type = type;
			this.who = who;
		}
	}

}