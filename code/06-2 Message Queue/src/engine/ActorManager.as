package engine 
{
	public class ActorManager implements IDisposable
	{	
		/// Collection of actor.
		public var actors	: Vector.<Actor>;
		

		/// CTOR
		public function ActorManager() 
		{
			actors = new Vector.<Actor>();			
		}
		
		
		/// @see IDisposable
		public function dispose():void	
		{
			actors = null;
		}
		
		
		/// Add new actor to be managed by the system
		public function add( actor:Actor ):void
		{
			// Make sure it isn't already on list
			if ( actors.indexOf( actor ) != -1 )
			{
				warn("Attempt to re-add actor '" + actor + "'");
				return;
			}
			
			actors.push( actor );
		}
		
		
		/// Called once per-frame, update all enabled actors
		public function update():void
		{
			var actor	: Actor;
			var len		: int = actors.length;
			
			for ( var i:int = 0; i < len; i++)
			{
				actor = actors[i];		// obtain referece
				
				if ( !actor.enabled )	// ignore if not enabled
					continue;
					
				actor.update();			// general update
			}
		}
		
		/// Remove actor from collection; if it exists
		public function remove( actor:Actor ):void
		{
			var index:int = actors.indexOf( actor );
			if ( index != -1 )
				actors.splice( index, 1 );
		}
		
		
		/// Clear all actors
		public function clear():void
		{
			actors = new Vector.<Actor>();
		}
		
		
		/**
		 * Obtain a specific actor
		 * @param	id
		 * @return	reference to actor, or null if not in manager
		 */
		public function get( id:uint ):Actor
		{
			var actor:Actor;	// Temporary reference
			
			// Loop through all actors, from start to end
			var len:int = actors.length;
			for ( var i:int = 0; i < len; i++)
			{
				actor = actors[i];
				if ( id == actor.id )
					return actor;
			}
			
			return null;
		}
	}

}