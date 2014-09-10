package com.games.funslot.view.mediators 
{
	import com.games.funslot.view.api.IInfoPanel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class InfoPanelMediator extends Mediator 
	{
		[Inject]
		public var view:IInfoPanel;
		
		override public function initialize():void
		{
			view.updateBet("BET: " + String(32423));
		}
		
		override public function destroy():void
		{
			view.destroy();
		}
	}

}