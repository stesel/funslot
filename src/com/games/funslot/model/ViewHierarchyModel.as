package com.games.funslot.model 
{
	import com.games.funslot.model.api.IViewHierarchyModel;
	import com.games.funslot.view.Background;
	import com.games.funslot.view.ControlPanel;
	import com.games.funslot.view.InfoPanel;
	import com.games.funslot.view.SlotBase;
	import robotlegs.bender.extensions.contextView.ContextView;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ViewHierarchyModel implements IViewHierarchyModel
	{
		
		[Inject]
		public var contextView:ContextView;
		
		public function addBackground():void
		{
			contextView.view.addChild(new Background());
		}
		
		public function addInfoPanel():void
		{
			contextView.view.addChild(new InfoPanel());
		}
		
		public function addControlPanel():void
		{
			contextView.view.addChild(new ControlPanel());
		}
		
		public function addSlotBase():void
		{
			contextView.view.addChild(new SlotBase());
		}
		
	}

}