package com.games.funslot.configuration 
{
	import com.games.funslot.view.mediators.SlotBaseMediator;
	import com.games.funslot.view.SlotBase;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	/**
	 * ...Configure Mediator Map
	 * @author Leonid Trofymchuk
	 */
	public class ViewConfiguration implements IConfig
	{
		[Inject]
		public var contextView:ContextView;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		public function configure():void
		{
			// Create a SlotBaseMediator for each SlotBase
			// that lands inside of the Context View
			mediatorMap.map(SlotBase).toMediator(SlotBaseMediator);
			
			//contextView.view.addChild(new SlotBase());
		}
		
	}
}
