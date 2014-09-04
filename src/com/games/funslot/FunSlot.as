package com.games.funslot
{
	import com.games.funslot.context.FunSlotContext;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	
	[SWF(width="800", height="600", backgroundColor="#000000", frameRate="30")]
	public class FunSlot extends Sprite 
	{
		private var context:FunSlotContext;
		
		public function FunSlot():void 
		{
			stage ? init() : addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			context = new FunSlotContext(this);
		}
		
	}
	
}