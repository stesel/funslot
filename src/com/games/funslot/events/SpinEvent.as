package com.games.funslot.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class SpinEvent extends Event 
	{
		static public const ENABLE_SPIN		:String = "SpinEvent.ENABLE_SPIN";
		static public const DISABLE_SPIN	:String = "SpinEvent.DISABLE_SPIN";
		
		static public const START_SPIN		:String = "SpinEvent.START_SPIN";
		static public const STOP_SPIN		:String = "SpinEvent.STOP_SPIN";
		static public const SPIN_STOPED		:String = "SpinEvent.SPIN_STOPED";
		
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