package com.games.funslot.events.factories 
{
	import com.games.funslot.events.SpinEvent;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class SpinEventFactory 
	{
		static public function procedureEnableSpinEvent():SpinEvent
		{
			return new SpinEvent( SpinEvent.ENABLE_SPIN );
		}
		
		static public function procedureDisableSpinEvent():SpinEvent
		{
			return new SpinEvent( SpinEvent.DISABLE_SPIN );
		}
		
		static public function procedureStartSpinEvent():SpinEvent
		{
			return new SpinEvent( SpinEvent.START_SPIN );
		}
		
		static public function procedureStopSpinEvent():SpinEvent
		{
			return new SpinEvent( SpinEvent.STOP_SPIN );
		}
		
	}

}