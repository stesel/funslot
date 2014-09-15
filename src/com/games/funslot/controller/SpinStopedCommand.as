package com.games.funslot.controller 
{
	import com.games.funslot.events.factories.SpinEventFactory;
	import flash.events.IEventDispatcher;
	import robotlegs.bender.bundles.mvcs.Command;
	/**
	 * ...
	 * @author Leonid Trofymchuk

	 */
	public class SpinStopedCommand extends Command
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		override public function execute():void
		{
			eventDispatcher.dispatchEvent( SpinEventFactory.procedureEnableSpinEvent() );
		}
	}

}