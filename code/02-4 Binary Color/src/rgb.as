package  
{
	/// Convery red, green, and blue values into a single RGB triplet
	function rgb( red:uint, green:uint, blue: uint) :uint
	{
		var result:uint = 0;
		
		result = red << 16;
		result = result | ( green << 8 );
		result = result | blue;
		
		return result;
	}		
}