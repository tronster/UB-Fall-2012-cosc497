package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Q1:	Move all the loop invariant code so it produces the same output but is now optimized.
	 */
	public class Main extends Sprite 
	{
		private const MAX		: int = 100;
		private var attackTable	: Vector.<int>;
		
		
		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			attackTable = new Vector.<int>();
			
			var attack			:int = 0;
			var baseAttack		:int = 20;
			var weaponAttack	:int = 10;
			
			for ( var i:int = 0; i < MAX; i++) 
			{
				attack = baseAttack + weaponAttack;
				attackTable[i] = 6 * i + attack * attack;
			}
		}
		
	}
	
}