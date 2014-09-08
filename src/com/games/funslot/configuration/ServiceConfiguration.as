package com.games.funslot.configuration 
{
	import com.games.funslot.service.api.ILoaderService;
	import com.games.funslot.service.LoaderService;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	/**
	 * ... Configure Model Map
	 * @author Leonid Trofymchuk
	 */
	
	public class ServiceConfiguration implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		public function configure():void
		{
			// Map Services as a context enforced singletons
			injector.map(ILoaderService).toSingleton(LoaderService);
		}
	}

}