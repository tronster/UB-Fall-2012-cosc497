package messages 
{
	import engine.Message;

	public class UnselectMsg extends Message
	{	
		public var unitId:uint;
		
		
		/// CTOR
		public function UnselectMsg( unitId:uint ) 
		{
			super( Type.MSG_UNSELECT, Global.localPlayer );
			this.unitId = unitId;
		}
		
	}

}