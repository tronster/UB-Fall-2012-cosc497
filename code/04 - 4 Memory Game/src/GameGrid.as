package  
{
	import flash.display.Sprite;
	import engine.*;
	
	/**
	 * Wraps 2d array implementaton by taking and returning grid cells.
	 * Adds and removes a cell to the display based on it's cellx & celly
	 */
	public class GameGrid extends Sprite
	{
		private var arr:Array2d;
		
		
		/**
		 * CTOR
		 * @param	cellsAcross		width in # of cells
		 * @param	cellsHigh		heigh in # of cells
		 */
		public function GameGrid( cellsAcross:int, cellsHigh:int ) 
		{
			arr = new Array2d( cellsAcross, cellsHigh );
		}
		
		// Put a cell into a location.
		public function put( cellx:int, celly:int, cell:Cell ):void
		{
			// Save data by location
			arr.put( cellx, celly, cell );

			// Compose on to the screen (via this Sprite)
			addChild( cell );
			cell.x = cell.width * cellx;
			cell.y = cell.height * celly;
		}
		
		// Get a cell at a location
		public function at( cellx:int, celly:int ):Cell
		{
			return Cell( arr.at( cellx, celly ) );
		}
		
		public function get cols():int { return arr.cols; }
		public function get rows():int { return arr.rows; }
	}

}