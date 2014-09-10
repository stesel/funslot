package com.games.funslot.view.mediators 
{
	import com.games.funslot.enum.DisplaySettings;
	import com.games.funslot.model.api.IStyleModel;
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
		
		[Inject]
		public var styleModel:IStyleModel;
		
		override public function initialize():void
		{	
			view.x = DisplaySettings.HELP_PANEL_X;
			view.y = DisplaySettings.HELP_PANEL_Y;
			
			view.decorate(styleModel);
			
			view.updateCash("CASH:" + String(""));
			view.updateWin("WIN:" + String(5675067));
			view.updateBet("BET:" + String(324203));
		}
		
		override public function destroy():void
		{
			view.destroy();
		}
	}

}