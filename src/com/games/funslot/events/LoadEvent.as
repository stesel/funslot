package com.games.funslot.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class LoadEvent extends Event 
	{
		static public const LOAD_IMAGES			:String = "LoadEvent.LOAD_IMAGES";
		
		static public const CONFIG_LOADED		:String = "LoadEvent.CONFIG_LOADED";
		static public const STYLE_LOADED		:String = "LoadEvent.STYLE_LOADED";
		static public const IMAGES_LOADED		:String = "LoadEvent.IMAGES_LOADED";
		
		public function LoadEvent(type:String) 
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new SpinEvent(type);
		}

		override public function toString():String
		{
			return formatToString("LoadEvent");
		}
		
	}

}