package com.games.funslot.events.factories 
{
	import com.games.funslot.events.SpinEvent;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class SpinEventFactory 
	{
		static public function procedureStartSpinEvent():SpinEvent
		{
			return new SpinEvent( SpinEvent.START_SPIN );
		}
		
	}

}