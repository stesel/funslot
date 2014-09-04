package com.games.funslot.view 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class SlotBase extends Sprite 
	{
		
		public function SlotBase() 
		{
			stage ? init() : addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			with (this.graphics)
			{
				clear();
				beginFill(0xff00ff, 1);
				drawRect(0, 0, 200, 200);
				endFill();
			}
		}
		
	}

}