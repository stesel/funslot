package com.games.funslot.controller 
{
	import com.games.funslot.events.SpinEvent;
	import com.games.funslot.model.api.IGameModel;
	import robotlegs.bender.bundles.mvcs.Command;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class StartSpinCommand extends Command
	{
		[Inject]
		public var event:SpinEvent;
		
		[Inject]
		public var model:IGameModel;
		
		override public function execute():void
		{
			trace.apply(this, [event.type]);
		}
	}
}