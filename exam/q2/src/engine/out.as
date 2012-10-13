package engine 
{		
	public function out( msg:String ):void 
	{
		Systems.console.add( msg );
		trace( msg );
	}

}