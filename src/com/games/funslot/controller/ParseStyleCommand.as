package com.games.funslot.controller 
{
	import com.games.funslot.enum.AssetID;
	import com.games.funslot.model.api.IStyleModel;
	import com.games.funslot.service.api.IAssetProvider;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ParseStyleCommand extends Command 
	{
		[Inject]
		public var assetProvider:IAssetProvider;
		
		[Inject]
		public var styleModel:IStyleModel;
		
		override public function execute():void
		{
			const styleXML:XML = assetProvider.getXML( AssetID.STYLE_XML );
			
			styleModel.parse(styleXML);
		}
		
	}

}