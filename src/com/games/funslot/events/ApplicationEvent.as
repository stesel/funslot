package com.games.funslot.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ApplicationEvent extends Event 
	{
		static public const START_UP	:String = "ApplicationEvent.START_UP";
		static public const BUILD_UI	:String = "ApplicationEvent.BUILD_UI";
		
		public function ApplicationEvent(type:String) 
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new ApplicationEvent(type);
		}

		override public function toString():String
		{
			return formatToString("ApplicationEvent");
		}
		
	}

}