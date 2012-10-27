package 
{
	import engine.Pool;
	import net.hires.utils.Stats;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Main extends Sprite 
	{
		private const MAX_PARTICLES	:int = 9999;
		private const MIN_LIFE		:int = 100;
		private const MAX_LIFE		:int = 1000;
		
		private var particles		:Vector.<Particle>;
		private var frame			:uint = 0;
		
		
		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		/// Initialize
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);			
			
			addChild( new Stats() );				// show stats 
			particles = new Vector.<Particle>();	// allocate container to hold all particles
						
			addEventListener( Event.ENTER_FRAME, update );
		}
		
		
		/// Called once per frame.
		private function update( e:Event ):void
		{
			frame++;
			
			var len		: int = particles.length;
			var particle: Particle;
			
			// Add more
			if ( len < MAX_PARTICLES )
			{
				particle 		= Pool.take( Particle );
						
				particles.push( particle);
				addChild( particle );
				
				particle.x 		= Math.random() * stage.stageWidth;
				particle.y 		= 0;
				particle.life	= MIN_LIFE + (( MAX_LIFE - MIN_LIFE ) * Math.random() );
			}
			
			for ( var i:int = len - 1; i > -1; i-- )
			{
				particle = particles[i];
				
				particle.life--;
				if ( particle.life < 1 || particle.y >= stage.stageHeight )
				{
					removeChild( particle );	// remove from display
					particles.splice( i, 1 );	// remove from collection
					Pool.give( particle );		// put back into pool for re-use
					continue;
				}
				
				particle.y++;
				particle.x += Math.sin( (frame + i) * 0.01 );
			}
			
		}
		
	}
	
}