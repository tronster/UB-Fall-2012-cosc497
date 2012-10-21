package engine 
{
	/// Return random integeter
	public function rand( max:int = 99999999 ):int 
	{
		return int( Math.random() * max );
	}

}