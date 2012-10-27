package  
{
	import engine.AudioClip;
	import engine.SoundManager;
	/**
	 * One stop shop for external resources
	 */
	public class Resources 
	{
		[Embed(source = "../lib/MusicTrack1.mp3")]
		static public var MusicTrack1:Class;
		
		[Embed(source = "../lib/stuff.mp3")]
		static public var stuff:Class;

		
		static public function init():void
		{
			SoundManager.add( new AudioClip( MusicTrack1, true ) );
			SoundManager.add( new AudioClip( stuff, false ) );
		}
		
	}

}