package com.games.funslot.controller 
{
	import com.games.funslot.events.factories.LoadEventFactory;
	import com.games.funslot.events.LoadEvent;
	import flash.events.IEventDispatcher;
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ProcessAssetsCommand extends Command 
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		override public function execute():void
		{
			eventDispatcher.dispatchEvent(LoadEventFactory.procedureLoadStyle())
		}
	}

}