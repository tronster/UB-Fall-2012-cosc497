package  
{
	/**
	 * One stop shop for external resources
	 */
	public class Resources 
	{		
		[ Embed(
			source = "../lib/ostrich-bold.ttf",
			fontName = "MainFont",
			mimeType = "application/x-font",
			advancedAntiAliasing = "true",
			embedAsCFF="false") ]
		static public var MainFont :Class;
		

		/// Initialization guarantees that a resource is used at least once,
		/// so the compiler knows to embed all resources referenced.
		static public function init():void
		{
			new MainFont();
		}
		
	}
}