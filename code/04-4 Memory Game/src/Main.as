package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import engine.*;
	
	
	public class Main extends Sprite 
	{
		private const GAME_CELLS_ACROSS	:int = 4;
		private const GAME_CELLS_HEIGHT	:int = 3;
		
		
		private var grid			: GameGrid;
		private var tf				: TextField;
		private var matchesMade		: int;
		private var matches			: int;
		private var firstCell		: Cell;
		
		private var clicks			: int;
		
		
		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		/// Initalize
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			// init sub-systems and resources
			Display.init( stage );
			Resources.init();
			
			// initialize global accessible classes
			Global.main = this;
			
			// Logic below is to create and populate a grid with
			// randomly matching square.
			
			grid 		= new GameGrid( GAME_CELLS_ACROSS, GAME_CELLS_HEIGHT );			
			matches 	= ((grid.cols * grid.rows ) / 2);
			matchesMade = 0;
			
			var insertAt	: int;
			var order		: Vector.<int> 	= new Vector.<int>();

			// Loop twice, each time inserting one piece of each pair
			for ( var round:int = 0; round < 2; round++ )
			{
				// Go through each value
				for ( var value:int = 0; value < matches; value++ )
				{
					// Find random inserting point and insert value
					insertAt = Math.floor( order.length * Math.random() );
					order.splice( insertAt, 0, value );
				}
			}
			
			// If an odd # of cells, fill the first value with the special -1.
			// Add it to front since below the grid is populated by poping values
			// off of the back
			var isOdd :Boolean = ( (grid.cols * grid.rows) % 2 ) == 1;
			if ( isOdd )
				order.splice(0, 0, -1 );
			
			// debug: forces a specific order
			//order = Vector.<int>([5, 1, 2, 3, 3, 1, 0, 4, 5, 0, 2, 4]);
				
			// Now actually create the cells and popluate them with the randomized
			// list of #'s that represent their differnt colors.
			var cell:Cell;			
			for (var i:int = 0; i < grid.cols; i++ )
			{
				for (var j:int = 0; j < grid.rows; j++ )
				{
					cell = new Cell( order.pop() );
					grid.put( i, j, cell ); 
				}
			}
			
			// Add the entire grid to the display and center it
			Display.main.addChild( grid );
			grid.x = (stage.stageWidth * 0.5) - (grid.width * 0.5 );
			grid.y = (stage.stageHeight * 0.5) - (grid.height * 0.5);
			
			// Add a score table
			tf = maketf( 100 );
			tf.antiAliasType = AntiAliasType.ADVANCED;
			tf.text = "0";
			tf.x = stage.stageWidth - (tf.width * 1.25 );
			tf.y = 0;
			tf.autoSize = TextFieldAutoSize.RIGHT;
			Display.ui.addChild( tf );
		}
		
		
		/**
		 * Called by a recently revealed cells to see if a match occurred.
		 * @param	cell
		 */
		public function score( cell:Cell ):void
		{
			if ( firstCell == null )
			{
				firstCell = cell;
				return;
			}
			
			clicks++;
			
			if ( firstCell.value == cell.value )
			{
				firstCell.setMatched();
				cell.setMatched();
				matchesMade++;
			}
			else
			{
				firstCell.rehide();
				cell.rehide();
			}
			
			firstCell = null;
			
			realizeScore();
		}
		
		/// Compute score and show it on the screen.
		private function realizeScore():void
		{
			var score:int = (matchesMade * 100) - (clicks * 2);
			if ( score < 0 )
				score = 0;
				
			tf.text = String( score );
			
			if ( matchesMade == matches )
			{
				// move score location and pump up size.
				tf.x = ( stage.stageWidth / 2 ) - ( tf.textWidth / 2 );
				tf.y = ( stage.stageHeight / 2 ) - ( tf.textHeight / 2 );
				
				addEventListener( Event.ENTER_FRAME, onFrame_gameOver );
			}
		}
		
		/// Play the game over sequence
		private function onFrame_gameOver( e:Event ):void
		{
			grid.z--;
			grid.alpha -= 0.002;
			
			if ( grid.alpha < 0.01 )
			{
				removeEventListener( Event.ENTER_FRAME, onFrame_gameOver );
				Display.main.removeChild( grid );
				
				stage.addEventListener( MouseEvent.CLICK, onClick_restart );
			}
		}

		/// Game is over click to restart
		private function onClick_restart( e:MouseEvent ):void
		{
			stage.removeEventListener( MouseEvent.CLICK, onClick_restart );
			Display.ui.removeChild( tf );
			init();
		}
	}
	
}