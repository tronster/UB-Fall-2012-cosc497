package  
{
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import engine.*;
	
	
	/**
	 * Holds a color and some logic for cell clicking.
	 */
	public class Cell extends Sprite
	{
		private const SIZE				:int = 50;
		private const SHOW_FOR_FRAMES 	:int = 15;
		
		public var	value	:int;

		private var frame	:int;
		
		private var isShowing	:Boolean;
		private var isMatched	:Boolean;
		private var tf			:TextField;
		
		
		/**
		 * CTOR
		 * @param	main	Reference back to main class
		 * @param	value	The value of this cell (used for matching)
		 */
		public function Cell( value:int ) 
		{
			this.value 	= value;
			
			tf = maketf( SIZE );
			tf.text = "?";
			addChild( tf );
			
			isShowing	= false;
			isMatched	= false;

			realizeHidden();
			
			// Special case, an odd square that isn't used in the game.
			if ( value == -1 )
			{
				realizeShown();
				isShowing	= true;
				isMatched	= true;				
				return;
			}			
			
			
			addEventListener( MouseEvent.CLICK, onClick );
		}
		
		
		public function onClick( e:MouseEvent ):void
		{
			// Ignore
			if ( isShowing ) return;
			
			realizeShown();
			Global.main.score( this );
		}
		
		
		public function setMatched():void
		{
			isMatched = true;
			removeEventListener( MouseEvent.CLICK, onClick );
		}
		
		
		public function rehide():void
		{
			frame = 0;
			addEventListener( Event.ENTER_FRAME, update );
		}
		
		
		public function update( e:Event ):void
		{
			frame++;
			if ( frame == SHOW_FOR_FRAMES )
			{
				removeEventListener( Event.ENTER_FRAME, update );
				realizeHidden();
			}

		}
		
		
		/// Draw for a clicked or matched square.
		private function realizeShown():void
		{
			var color:uint;
			switch( value )
			{
				case -1:color = 0x505050;	break;	// gray (invalid cell)
				case 0:	color = 0xdd0000;	break;
				case 1:	color = 0xcc8800;	break;
				case 2:	color = 0xeeee00;	break;
				case 3:	color = 0x00bb00;	break;
				case 4: color = 0x99ff99;	break;
				case 5: color = 0x00eeff;	break;
				case 6: color = 0x0000dd;	break;
				case 7: color = 0x8800cc;	break;
				case 8: color = 0xdd00dd;	break;
				case 9: color = 0xffaaaa;	break;	// pink
				case 10:color = 0xaaffaa;	break;
				case 11:color = 0xaaaaff;	break;
				default: color = 0x775533;	break;	// nasty brown				
			}
			
			// Turn off the question mark and draw a square
			tf.visible = false;
			graphics.clear();
			graphics.beginFill( color, 1 );
			graphics.drawRect(0, 0, SIZE * 2, SIZE * 2);
			graphics.endFill();
			
			isShowing = true;
		}
		
		
		/// Draw a hidden square
		private function realizeHidden():void
		{
			graphics.clear();
			
			graphics.beginGradientFill(GradientType.LINEAR, [0xff0000, 0x0000ff], [1, 1], [0, 255] );
			graphics.drawRect(0, 0, SIZE * 2, SIZE * 2);
			graphics.endFill();
			
			var matrix:Matrix = new Matrix(1, 0, 0, 1, 0, 0);
			matrix.rotate( 180 );
			graphics.beginGradientFill(GradientType.LINEAR, [0x00ff00, 0x0000ff], [0.9, 0.3], [0, 255], matrix );
			graphics.drawRect(0, 0, SIZE * 2, SIZE * 2);
			graphics.endFill();

			tf.visible = true;
			
			isShowing = false;
		}
	}

}