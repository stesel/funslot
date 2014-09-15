package com.games.funslot.controller 
{
	import com.games.funslot.events.factories.GameEventFactory;
	import com.games.funslot.events.factories.SpinEventFactory;
	import com.games.funslot.model.api.IGameModel;
	import com.games.funslot.service.api.IGameProccesService;
	import flash.events.IEventDispatcher;
	import robotlegs.bender.bundles.mvcs.Command;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class StopSpinCommand extends Command
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject]
		public var gameProccesService:IGameProccesService;
		
		[Inject]
		public var gameModel:IGameModel;
		
		override public function execute():void
		{
			gameModel.win = gameProccesService.winFactor * gameModel.bet;
			gameModel.balance = gameModel.balance + gameModel.win;
			
			eventDispatcher.dispatchEvent( GameEventFactory.procedureGameModelUpdatedEvent() );
			
			eventDispatcher.dispatchEvent( SpinEventFactory.procedureEnableSpinEvent() );
		}
	}

}