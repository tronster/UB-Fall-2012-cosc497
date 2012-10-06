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
		static public var main		: Sprite;
		static public var ui		: Sprite;
		

		/// Initalize
		static public function init( stage:Stage ):void
		{
			Display.stage 	= stage;
			
			// Set the global display properties.
			width 	= stage.stageWidth;
			height	= stage.stageHeight;
			
			
			// Create sprites for all pieces of the game to draw to; and one for instructions.
			main	= new Sprite();
			ui		= new Sprite();
			
			// Layered base on the order
			stage.addChild( main );
			stage.addChild( ui );
		}

		
		/// Clear all
		static public function clear() :void
		{
			main.removeChildren();
			ui.removeChildren();
		}
		
	}

}