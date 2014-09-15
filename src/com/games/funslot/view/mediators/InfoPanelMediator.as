package com.games.funslot.view.mediators 
{
	import com.games.funslot.enum.DisplaySettings;
	import com.games.funslot.events.GameEvent;
	import com.games.funslot.model.api.IGameModel;
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
		
		[Inject]
		public var gameModel:IGameModel;
		
		override public function initialize():void
		{
			addContextListener(GameEvent.GAME_MODEL_UPDATED, updateView);
			
			initView();
		}
		
		private function initView():void 
		{
			view.x = DisplaySettings.HELP_PANEL_X;
			view.y = DisplaySettings.HELP_PANEL_Y;
			
			view.decorate(styleModel);
			
			updateView();
		}
		
		private function updateView(e:GameEvent = null):void 
		{
			view.updateCash("CASH:" + String( gameModel.balance ));
			view.updateWin("WIN:" + String( gameModel.win ));
			view.updateBet("BET:" + String( gameModel.bet ));
		}
		
		override public function destroy():void
		{
			removeContextListener(GameEvent.GAME_MODEL_UPDATED, updateView);
			view.destroy();
		}
	}

}