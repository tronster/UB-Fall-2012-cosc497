package engine 
{
	/// Helper function to put message in the message queue.
	public function sendMsg( msg:Message ):void 
	{
		MessageQueue.add( msg );
	}

}