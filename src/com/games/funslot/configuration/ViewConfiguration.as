package com.games.funslot.configuration 
{
	import com.games.funslot.view.api.IBackground;
	import com.games.funslot.view.api.IControlPanel;
	import com.games.funslot.view.api.IInfoPanel;
	import com.games.funslot.view.mediators.BackgroundMediator;
	import com.games.funslot.view.mediators.ControlPanelMediator;
	import com.games.funslot.view.mediators.InfoPanelMediator;
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
			// Create Mediators for each Views
			// that lands inside of the Context View
			mediatorMap.map(IBackground).toMediator(BackgroundMediator);
			mediatorMap.map(IInfoPanel).toMediator(InfoPanelMediator);
			mediatorMap.map(IControlPanel).toMediator(ControlPanelMediator);

		}
		
	}
}
