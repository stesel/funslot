package com.games.funslot.configuration
{
	import com.games.funslot.controller.BuildApplicationUI;
	import com.games.funslot.controller.LaunchAppCommand;
	import com.games.funslot.controller.LoadAssetsCommand;
	import com.games.funslot.controller.LoadStyleCommand;
	import com.games.funslot.controller.ParseConfigCommand;
	import com.games.funslot.controller.ParseStyleCommand;
	import com.games.funslot.controller.ProcessAssetsCommand;
	import com.games.funslot.controller.StartSpinCommand;
	import com.games.funslot.controller.StopSpinCommand;
	import com.games.funslot.events.ApplicationEvent;
	import com.games.funslot.events.LoadEvent;
	import com.games.funslot.events.SpinEvent;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
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
			
			//Build App
			commandMap.map(ApplicationEvent.START_UP).toCommand(LaunchAppCommand).once();
			
			commandMap.map(LoadEvent.LOAD_IMAGES).toCommand(LoadAssetsCommand).once();
			commandMap.map(LoadEvent.LOAD_STYLE).toCommand(LoadStyleCommand).once();
			
			commandMap.map(LoadEvent.CONFIG_LOADED).toCommand(ParseConfigCommand).once();
			commandMap.map(LoadEvent.IMAGES_LOADED).toCommand(ProcessAssetsCommand).once();
			commandMap.map(LoadEvent.STYLE_LOADED).toCommand(ParseStyleCommand).once();
			
			commandMap.map(ApplicationEvent.BUILD_UI).toCommand(BuildApplicationUI).once();
			
			//Gameplay
			commandMap.map(SpinEvent.START_SPIN).toCommand(StartSpinCommand);
			commandMap.map(SpinEvent.STOP_SPIN).toCommand(StopSpinCommand);
		}
	}

}