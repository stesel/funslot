package com.games.funslot.configuration 
{
	import com.games.funslot.model.api.IConfigModel;
	import com.games.funslot.model.api.IGameModel;
	import com.games.funslot.model.api.IStyleModel;
	import com.games.funslot.model.api.IViewHierarchyModel;
	import com.games.funslot.model.ConfigModel;
	import com.games.funslot.model.GameModel;
	import com.games.funslot.model.StyleModel;
	import com.games.funslot.model.ViewHierarchyModel;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	/**
	 * ... Configure Model Map
	 * @author Leonid Trofymchuk
	 */

	public class ModelConfiguration implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		public function configure():void
		{
			// Map Models as a context enforced singletons
			
			injector.map(IConfigModel).toSingleton(ConfigModel);
			
			injector.map(IGameModel).toSingleton(GameModel);
			
			injector.map(IViewHierarchyModel).toSingleton(ViewHierarchyModel);
			
			injector.map(IStyleModel).toSingleton(StyleModel);
		}
	}

}