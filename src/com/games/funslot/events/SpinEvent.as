package com.games.funslot.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class SpinEvent extends Event 
	{
		static public const START_SPIN		:String = "SpinEvent.START_SPIN";
		
		public function SpinEvent(type:String) 
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new SpinEvent(type);
		}

		override public function toString():String
		{
			return formatToString("SpinEvent");
		}
		
	}

}