package com.games.funslot.events 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class GameEvent extends Event
	{	
		
		public function GameEvent(type:String)  
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new GameEvent(type);
		}

		override public function toString():String
		{
			return formatToString("GameEvent");
		}
	}

}