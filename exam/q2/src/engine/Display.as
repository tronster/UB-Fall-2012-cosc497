package engine 
{
	import flash.display.Sprite;
	import flash.display.Stage;

	
	/**
	 * Globally accessible information about the display (aka: stage)
	 */
	public class Display 
	{
		static public var width		: uint;
		static public var height	: uint;

		static public var stage		: Stage;
		static public var bg		: Sprite;
		static public var main		: Sprite;
		static public var ui		: Sprite;
		static public var console	: Sprite;
		

		/// Initalize
		static public function init( stage:Stage ):void
		{
			Display.stage = stage;
			
			// Set the global display properties.
			width 	= stage.stageWidth;
			height	= stage.stageHeight;
			
			
			// Create sprites for all pieces of the game to draw to; and one for instructions.
			bg		= new Sprite();
			main	= new Sprite();
			ui		= new Sprite();
			console	= new Sprite();
			
			// Layered base on the order
			/* This is a gimme, I just uncommented out adding these to the display chain; that's right..
			stage.addChild( bg );
			stage.addChild( main );
			stage.addChild( ui );
			stage.addChild( console );
			*/
		}
		
	}

}