package  
{
	import engine.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.geom.Point;
	import messages.SelectMsg;
	import messages.UnselectMsg;
	
	
	public class Unit extends Actor implements IDisposable
	{
		private var isSelected		: Boolean = false;

		private var imgUnselected	: BitmapData;
		private var imgSelected		: BitmapData;
		
		
		/// CTOR
		public function Unit() 
		{
			super();
			
			out("Created unit '" + id + "'");
			
			// Create custom images...
			//imgUnselected = new BitmapData(32, 32);
			//imgUnselected.perlinNoise( 32, 32, 6, rand(), false, false );
			imgUnselected = Resources.Bob;
			
			imgSelected = new BitmapData(32, 32, true, 0xffffff00 );
			imgSelected.perlinNoise( 32, 32, 12, rand(), false, false );
			var temp:BitmapData = new BitmapData(32, 32, true, 0x90ffff00 );				// temp bitmap to allow for tint
			imgSelected.copyPixels( temp, temp.rect, new Point(0, 0), null, null, true );	// via merging
			
			
			// Set to unselected image
			img = new Bitmap();
			img.bitmapData = imgUnselected;
			
			Display.main.addChild( img );
		}
		
		
		/// Pseudo destructor
		override public function dispose():void 
		{
			Display.main.removeChild( img );			
			super.dispose();
		}
		
		
		override public function update():void
		{
			/// Call base class to update position, etc...
			super.update();
						
			/// Is the mouse being pressed?
			if ( Input.getMouseButtonDown( 0 ) )
			{
				if ( isPointCollide( Input.mousePosition.x, Input.mousePosition.y ) )
				{					
					if ( !isSelected )
					{
						var msg:SelectMsg = new SelectMsg( id );
						sendMsg( msg );
					}
					else
					{
						var umsg:UnselectMsg = new UnselectMsg( id );
						sendMsg( umsg );
					}
				}
				
			}
		}
		
		
		// --------------------------------------------------------------------
		//	Functions below here work in response to a message
		//	Be careful raising new messages here
		// --------------------------------------------------------------------
		
		
		public function select():void
		{
			isSelected 		= true;
			img.bitmapData 	= imgSelected;
		}
		
		public function unselect():void
		{
			isSelected		= false;
			img.bitmapData 	= imgUnselected;
		}
	}

}