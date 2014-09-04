package com.games.funslot.model 
{
	import com.games.funslot.model.api.IViewHierarchyModel;
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
		
		public function ViewHierarchyModel() 
		{
			
		}
		
		public function addAppication():void
		{
			contextView.view.addChild(new SlotBase());
		}
		
	}

}