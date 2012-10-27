
package engine
{	
	public interface IDisposable
	{
		/**
		 * Pseudo destructor.
		 * Object should clear all event listeners and remove references.
		 */
		function dispose():void;
	}
	
}