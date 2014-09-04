package com.games.funslot.events.factories 
{
	import com.games.funslot.events.ApplicationEvent;
	import com.games.funslot.events.SpinEvent;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ApplicationEventFactory
	{
		static public function procedureStartUpEvent():ApplicationEvent
		{
			return new ApplicationEvent( ApplicationEvent.START_UP );
		}
		
	}

}