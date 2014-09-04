package com.games.funslot.configuration 
{
	import com.games.funslot.events.factories.ApplicationEventFactory;
	import flash.events.IEventDispatcher;
	import robotlegs.bender.framework.api.IConfig;
		
	/**
	 * ...Complete Configure
	 * @author Leonid Trofymchuk
	 */
		
	public class ConfigurationComplete implements IConfig
	{
		
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		public function configure():void
		{
			eventDispatcher.dispatchEvent(ApplicationEventFactory.procedureStartUpEvent());
		}
	}

}