package  
{
	import flash.display.DisplayObject;
	import flash.display.Stage;

	
	/// Helper function to center a bitmap or sprite
	/// REQUIREMENT: Image must be attaached to the display chain
	public function center( thing:DisplayObject ):void 
	{
		var stage:Stage = thing.stage;
		thing.x = (stage.stageWidth * 0.5) - (thing.width * 0.5);
		thing.y = (stage.stageHeight * 0.5) - (thing.height * 0.5);
	}

}