package  
{
	/**
	 * One stop shop for external resources
	 */
	public class Resources 
	{
		[Embed(source = "../lib/stuff.mp3")]
		static public var StuffSound:Class;
		
		[Embed(source = "../lib/MusicTrack1.mp3")]
		static public var MusicTrack1:Class;
		
		
		static public function init():void
		{
		}
		
	}

}