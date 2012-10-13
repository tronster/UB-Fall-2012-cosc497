package engine 
{
		
	public function warn( msg:String ):void 
	{		
		Systems.console.add( msg );
		trace( "2:" + msg );
	}

}