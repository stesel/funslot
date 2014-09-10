package com.games.funslot.controller 
{
	import com.games.funslot.events.LoadEvent;
	import com.games.funslot.model.api.IViewHierarchyModel;
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class BuildApplicationUI extends Command 
	{
		[Inject]
		public var viewHierarchyModel:IViewHierarchyModel
		
		override public function execute():void
		{
			viewHierarchyModel.addBackground();
			viewHierarchyModel.addInfoPanel();
			viewHierarchyModel.addControlPanel();
		}
		
	}

}