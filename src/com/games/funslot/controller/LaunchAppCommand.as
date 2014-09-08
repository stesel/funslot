package com.games.funslot.controller 
{
	import com.games.funslot.enum.AssetID;
	import com.games.funslot.events.ApplicationEvent;
	import com.games.funslot.events.factories.LoadEventFactory;
	import com.games.funslot.model.api.IConfigModel;
	import com.games.funslot.model.api.IViewHierarchyModel;
	import com.games.funslot.service.api.ILoaderService;
	import com.games.funslot.vo.LoadVO;
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class LaunchAppCommand extends Command
	{
		[Inject]
		public var loaderService:ILoaderService;
		
		[Inject]
		public var configModel:IConfigModel;
		
		[Inject]
		public var commandMap:IEventCommandMap;
		
		override public function execute():void
		{
			commandMap.unmap(ApplicationEvent.START_UP).fromCommand(LaunchAppCommand);
			
			//Start load external assets
			loaderService.addXML( new LoadVO(configModel.configURL, AssetID.CONFIG_XML) );
			loaderService.load(LoadEventFactory.procedureConfigLoaded());
		}
		
	}

}