package com.games.funslot.view.mediators 
{
	import com.games.funslot.enum.AssetID;
	import com.games.funslot.events.factories.SpinEventFactory;
	import com.games.funslot.events.SpinEvent;
	import com.games.funslot.service.api.IAssetProvider;
	import com.games.funslot.view.api.IControlPanel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ControlPanelMediator extends Mediator 
	{
		[Inject]
		public var assetProvider:IAssetProvider;
		
		[Inject]
		public var view:IControlPanel;
		
		override public function initialize():void
		{
			view.setAssets( assetProvider.getImage(AssetID.BUTTON_SPIN), assetProvider.getImage(AssetID.BUTTON_SPIN_D) );
			
			addViewListener(SpinEvent.START_SPIN, startSpin);
			
			addContextListener(SpinEvent.ENABLE_SPIN, enableSpin);
			addContextListener(SpinEvent.DISABLE_SPIN, disableSpin);
			
			view.enable();
		}
		
		private function enableSpin(e:SpinEvent):void 
		{
			view.enable();
		}
		
		private function disableSpin(e:SpinEvent):void 
		{
			view.disable();
		}
		
		private function startSpin(e:SpinEvent):void 
		{
			eventDispatcher.dispatchEvent( SpinEventFactory.procedureStartSpinEvent() );
			view.disable();
		}
		
		override public function destroy():void
		{
			removeViewListener(SpinEvent.START_SPIN, startSpin);
			
			removeContextListener(SpinEvent.ENABLE_SPIN, enableSpin);
			removeContextListener(SpinEvent.DISABLE_SPIN, disableSpin);
			
			view.destroy();
		}
		
	}

}