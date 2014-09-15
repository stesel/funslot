package com.games.funslot.events.factories 
{
	import com.games.funslot.events.GameEvent;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class GameEventFactory 
	{	
		static public function procedureGameModelUpdatedEvent():GameEvent
		{
			return new GameEvent( GameEvent.GAME_MODEL_UPDATED );
		}
		
	}

}