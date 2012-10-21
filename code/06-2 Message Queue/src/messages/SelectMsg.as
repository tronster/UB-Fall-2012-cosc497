package messages 
{
	import engine.Message;

	public class SelectMsg extends Message
	{	
		public var unitId:uint;
		
		
		/// CTOR
		public function SelectMsg( unitId:uint ) 
		{
			super( Type.MSG_SELECT, Global.localPlayer );
			
			this.unitId = unitId;
		}
		
	}

}