package  
{
	import engine.*;
	import flash.geom.Point;
	import flash.utils.getTimer;
	import messages.SelectMsg;
	import messages.UnselectMsg;

	
	public class GameState implements IState
	{
		private const MAX:int = 10;
		
		
		/// @see IState
		public function start():void
		{
			Systems.actors.clear();
			
			// If this was a multiplayer game, this value would be coming from
			// the lobby or whatever system assigns ids to players.
			Global.localPlayer = 1;
			
			var unit:Unit;
			for ( var i:int = 0; i < MAX; i++ )
			{
				unit = new Unit();
				Systems.actors.add( unit );
				unit.x = rand( Display.width );
				unit.y = rand( Display.height );
			}
			
		}
		
		
		/// @see IState
		public function update():void
		{
			const MAX_MS	:uint = 20;
			var bailStart	:uint = getTimer();
			
			/// Update all actors
			Systems.actors.update();
			
			for ( var msg:Message = MessageQueue.get(); msg != null; msg = MessageQueue.get() )
			{
				processMessage( msg );
				
				/// If it's taking too long to process messages, bail
				if ( getTimer() - bailStart > MAX_MS )
				{
					warn("Time out! " + (getTimer() - bailStart) + "ms.  Not all msgs handled in frame: " + Time.frameCount );
					break;
				}
			}
			
		}
		
		
		/// @see IState
		public function end():void
		{
			Systems.actors.clear();
		}
		
		
		/// Look at a message
		private function processMessage( msg:Message ):void
		{
			switch( msg.type )
			{
				case Type.MSG_MOVE:
					break;
				
				case Type.MSG_SELECT:	handleSelect( msg as SelectMsg );	break;
				case Type.MSG_UNSELECT: handleUnSelect( msg as UnselectMsg ); break;
					
				default:
					warn("Ignoring unknown message of type '" + msg.type );
					break;
			}
		}
		
		
		private function handleSelect( msg:SelectMsg ):void
		{
			var unit:Unit = Systems.actors.get( msg.unitId ) as Unit;
			unit.select();
		}
		
		private function handleUnSelect( msg:UnselectMsg ):void
		{
			var unit:Unit = Systems.actors.get( msg.unitId ) as Unit;
			unit.unselect();
		}
	}

}