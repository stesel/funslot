package com.games.funslot.controller 
{
	import com.games.funslot.enum.AssetID;
	import com.games.funslot.events.LoadEvent;
	import com.games.funslot.model.api.IConfigModel;
	import com.games.funslot.service.api.ILoaderService;
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ParseConfigCommand extends Command
	{
		[Inject]
		public var commandMap:IEventCommandMap;
		
		[Inject]
		public var loaderService:ILoaderService;
		
		[Inject]
		public var configModel:IConfigModel;
		
		override public function execute():void
		{
			commandMap.unmap(LoadEvent.CONFIG_LOADED).fromCommand(ParseConfigCommand);
			
			configModel.parseConfigXML(loaderService.getXML(AssetID.CONFIG_XML));
			
		}
		
	}

}