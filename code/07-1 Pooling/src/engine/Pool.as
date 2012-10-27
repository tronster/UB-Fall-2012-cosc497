package engine
{
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;			

	/**
	 * Actionscript 3 object pooling
	 * 
	 * Support for objects that can deal with single lifetime construction, as 
	 * well as objects that handle "recycling" for common operations that occur
	 * during re-use and non-use.
	 */
	final public class Pool
	{
		/// Pool containing different types.
		private static var pools	:Dictionary = new Dictionary();
	
		public function Pool() {
			throw new Error("Pool is static.");
		}
		

	
		/**
		 * Shows what types of pools exist
		 * @return String with names and current sizes of the pools.
		 */
		public static function toString() :String 
		{
			var types:String = "Pool: ";
			for (var key:* in pools)
				types += ( String(key).slice(7, String(key).length - 1)) + 
						 ":" + ( key.length == undefined ? 0 : key.length) +
						  ", ";

			return types.slice(0, types.length - 2);
		}


		/// @return number of pools setup
		public static function get length() :int
		{
			var i:int = 0;
			for (var key:* in pools) 
				i++;
			return i;			
		}
		
		/**
		 * Use this instead of "new"
		 * 
		 * @param	type
		 * @param	...args
		 * @return
		 */
		public static function take( type:Class, ...args ):* 
		{
			// Does a pool of this type exist?
			if (type in pools)
			{
				// Does an object exist in the pool>
				var current:Array = pools[type];
				if (current.length > 0)
				{
					var obj:* = current.pop();
					return( obj );
				}
			}
			else
			{
				// Create a entire "type" for the pool.
				pools[type] = new Array();
			}
			
			// Necessary hack for first instantiation.
			switch( args.length )
			{
				case 0:		return new type();
				case 1:		return new type( args[0] );
				case 2:		return new type( args[0], args[1] );
				case 3:		return new type( args[0], args[1], args[2] );
				case 4:		return new type( args[0], args[1], args[2], args[3] );
				case 5:		return new type( args[0], args[1], args[2], args[3], args[4] );
				case 6:		return new type( args[0], args[1], args[2], args[3], args[4], args[5] );
				case 7:		return new type( args[0], args[1], args[2], args[3], args[4], args[5], args[6] );
				case 8:		return new type( args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7] );
				case 9:		return new type( args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8] );
				case 10:	return new type( args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9] );
				case 11:	return new type( args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10] );
				case 12:	return new type( args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11] );
				case 13:	return new type( args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12] );
				case 14:	return new type( args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13] );
				case 15:	return new type( args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13], args[14] );
				default:
					throw new ArgumentError("Type's ctor takes " + args.length + " arguments, but Pool only supports maximum of 15.")
			}
			
			// If this happens, oh my!
			return null;			
		}
		
		
		/**
		 * Return an object to the pool for re-use.
		 * @param	obj	The object to return to the pool.
		 */
		public static function give( obj:* ) :void
		{
			var className	:String = getQualifiedClassName( obj );
			var cls			:Class 	= getDefinitionByName( className ) as Class;
			
			// Safty, if for some reason an object is being given back to the pool
			// but never originally came from it, create the "type" and add it.
			if ( !(cls in pools) ) 
				pools[cls] = new Array();
			
			pools[cls].push( obj )	
		}

	}
}