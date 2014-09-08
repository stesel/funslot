package com.games.funslot.configuration 
{
	import com.games.funslot.controller.LaunchAppCommand;
	import com.games.funslot.controller.LoadAssetsCommand;
	import com.games.funslot.controller.ParseConfigCommand;
	import com.games.funslot.controller.StartSpinCommand;
	import com.games.funslot.events.ApplicationEvent;
	import com.games.funslot.events.factories.ApplicationEventFactory;
	import com.games.funslot.events.LoadEvent;
	import com.games.funslot.events.SpinEvent;
	import flash.events.IEventDispatcher;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
		
	/**
	 * ... Configure Event Map
	 * @author Leonid Trofymchuk
	 */
		
	public class CommandConfiguration implements IConfig
	{
		[Inject]
		public var commandMap:IEventCommandMap;
		
		public function configure():void
		{
			// Execute Commands when Events are dispatched 
			// is dispatched on the context's Event Dispatcher
			commandMap.map(ApplicationEvent.START_UP).toCommand(LaunchAppCommand);
			
			commandMap.map(LoadEvent.CONFIG_LOADED).toCommand(ParseConfigCommand);
			
			commandMap.map(LoadEvent.LOAD_IMAGES).toCommand(LoadAssetsCommand);
			
			
			commandMap.map(SpinEvent.START_SPIN).toCommand(StartSpinCommand);
		}
	}

}