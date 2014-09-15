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
	[SWF(width="1", height="1", backgroundColor="#000000", frameRate="30")]
	public class LocalTestRunner extends Sprite 
	{
		public static const TESTS_COMPLETE:String = "testsComplete";
		
		private var core:FlexUnitCore;
		
		public function LocalTestRunner():void 
		{
			stage ? runTest() : addEventListener(Event.ADDED_TO_STAGE, runTest);
		}
		
		public function runTest(e:Event = null): void
		{
			trace.apply(this, ["Run local tests"]);
			core = new FlexUnitCore();
			core.addListener( new TraceListener());
			core.addEventListener( FlexUnitCore.TESTS_COMPLETE, testsComplete );
			core.run( AllFunSlotTestSuite );
		}
		
		private function testsComplete(e:Event):void 
		{
			trace.apply(this, ["Tests are completed"]);
			this.dispatchEvent(new Event(LocalTestRunner.TESTS_COMPLETE));
		}
		
	}
	
}