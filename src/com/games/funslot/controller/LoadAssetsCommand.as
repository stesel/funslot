package com.games.funslot.controller 
{
	import com.games.funslot.events.factories.LoadEventFactory;
	import com.games.funslot.events.LoadEvent;
	import com.games.funslot.model.api.IConfigModel;
	import com.games.funslot.service.api.ILoaderService;
	import com.games.funslot.vo.LoadVO;
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class LoadAssetsCommand extends Command
	{
		[Inject]
		public var commandMap:IEventCommandMap;	
		
		[Inject]
		public var loaderService:ILoaderService;
		
		[Inject]
		public var configModel:IConfigModel;
		
		override public function execute():void
		{
			commandMap.unmap(LoadEvent.LOAD_IMAGES).fromCommand(LoadAssetsCommand);
			
			for each (var asset:LoadVO in configModel.assetsURLs)
			{
				loaderService.addImage(asset);
			}
			
			loaderService.load( LoadEventFactory.procedureImagesLoaded() );

		}
	}

}