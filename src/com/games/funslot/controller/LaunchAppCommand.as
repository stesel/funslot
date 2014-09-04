package com.games.funslot.controller 
{
	import com.games.funslot.model.api.IViewHierarchyModel;
	import robotlegs.bender.bundles.mvcs.Command;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class LaunchAppCommand extends Command
	{
		
		[Inject]
		public var viewModel:IViewHierarchyModel;
		
		override public function execute():void
		{
			viewModel.addAppication();
		}
		
	}

}