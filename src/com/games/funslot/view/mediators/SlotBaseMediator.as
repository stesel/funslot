package com.games.funslot.view.mediators 
{
	import com.games.funslot.enum.AssetID;
	import com.games.funslot.events.factories.SpinEventFactory;
	import com.games.funslot.events.SpinEvent;
	import com.games.funslot.service.api.IAssetProvider;
	import com.games.funslot.service.api.IGameProccesService;
	import com.games.funslot.utils.SlotHelp;
	import com.games.funslot.view.api.ISlotBase;
	import com.games.funslot.vo.ImageAssetVO;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class SlotBaseMediator extends Mediator 
	{
		
		[Inject]
		public var assetProvider:IAssetProvider;
		
		[Inject]
		public var gameProccesService:IGameProccesService;
		
		[Inject]
		public var view:ISlotBase;
		
		override public function initialize():void
		{
			addSymbols();
			addBetLine();
		}
		
		private function addSymbols():void 
		{
			var colomn1:Vector.<ImageAssetVO>;
			var colomn2:Vector.<ImageAssetVO>;
			var colomn3:Vector.<ImageAssetVO>;
			
			colomn1 = new Vector.<ImageAssetVO>();
			
			for each(var symbol:String in AssetID.ALL_SYMBOLS)
			{
				colomn1.push( new ImageAssetVO( assetProvider.getImage(symbol), symbol) );
			}
			
			colomn2 = SlotHelp.copyColumn(colomn1);
			colomn3 = SlotHelp.copyColumn(colomn1);
			
			colomn1 = SlotHelp.sortRandom(colomn1);
			colomn2 = SlotHelp.sortRandom(colomn2);
			colomn3 = SlotHelp.sortRandom(colomn3);
			
			gameProccesService.addColoms(colomn1, colomn2, colomn3);
			
			view.addColoms(colomn1, colomn2, colomn3);
		}
		
		private function addBetLine():void 
		{
			view.addBetline(assetProvider.getImage(AssetID.BET_LINE));
		}
		
		private function spinStoped(e:SpinEvent):void 
		{
			eventDispatcher.dispatchEvent( SpinEventFactory.procedureSpinStopedEvent() );
		}
		
		override public function destroy():void
		{
			view.destroy();
		}
		
	}

}