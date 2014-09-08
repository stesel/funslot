package com.games.funslot.context
{
	import com.games.funslot.configuration.CommandConfiguration;
	import com.games.funslot.configuration.ConfigurationComplete;
	import com.games.funslot.configuration.ModelConfiguration;
	import com.games.funslot.configuration.ServiceConfiguration;
	import com.games.funslot.configuration.ViewConfiguration;
	import com.games.funslot.events.factories.ApplicationEventFactory;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.impl.Context;
	
	/**
	 * ...Init Robotlegs-2.2 Context
	 * @author Leonid Trofymchuk
	 */
	public class FunSlotContext extends Context 
	{
		
		public function FunSlotContext(contextView:DisplayObjectContainer = null):void 
		{
			super();
			
			install(MVCSBundle);
			configure(ModelConfiguration, ViewConfiguration, CommandConfiguration, ServiceConfiguration);
			configure(new ContextView(contextView));
			configure(ConfigurationComplete);
			initialize();
		}
		
	}
	
}