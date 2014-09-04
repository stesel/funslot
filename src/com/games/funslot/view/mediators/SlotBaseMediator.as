package com.games.funslot.view.mediators 
{
	import com.games.funslot.events.factories.SpinEventFactory;
	import com.games.funslot.view.SlotBase;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class SlotBaseMediator extends Mediator 
	{
		[Inject]
		public var view:SlotBase;
		
		override public function initialize():void
		{
			addViewListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			eventDispatcher.dispatchEvent( SpinEventFactory.procedureStartSpinEvent() );
		}
		
		override public function destroy():void
		{
			removeViewListener(MouseEvent.CLICK, dispatch);
		}
		
	}

}