package  
{
	/**
	 * Holds objects globally accessible.
	 */
	public class Global 
	{
		public static var player		: Player;
		public static var world			: World;

		
		/// CTOR: Instances not allowed.
		public function Global() 
		{
			throw new Error("Global is a static; it cannot be instantiated.");
		}
		
	}

}