package com.games.funslot 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.FlexUnitCore;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	[SWF(width="800", height="600", backgroundColor="#000000", frameRate="30")]
	public class LocalTestRunner extends Sprite 
	{
		private var core:FlexUnitCore;
		
		public function LocalTestRunner():void 
		{
			stage ? runTest() : addEventListener(Event.ADDED_TO_STAGE, runTest);
		}
		
		public function runTest(e:Event = null): void
		{
			core = new FlexUnitCore();
			core.addListener( new TraceListener());
			core.run( AllFunSlotTestSuite );
		}
		
	}
	
}