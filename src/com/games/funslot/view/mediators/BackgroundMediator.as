package com.games.funslot.view.mediators 
{
	import com.games.funslot.enum.AssetID;
	import com.games.funslot.service.api.IAssetProvider;
	import com.games.funslot.view.api.IBackground;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class BackgroundMediator extends Mediator 
	{
		[Inject]
		public var assetProvider:IAssetProvider;
		
		[Inject]
		public var view:IBackground;
		
		override public function initialize():void
		{
			view.setBackground(assetProvider.getImage(AssetID.BACKGROUND));
		}
		
		override public function destroy():void
		{
			view.destroy();
		}
		
	}

}