package engine
{	
	/// Forceful way for objects to release resources.
	public interface IDisposable
	{
		/**
		 * Pseudo destructor.
		 * Object should clear all event listeners and remove references.
		 */
		function dispose():void;
	}
	
}