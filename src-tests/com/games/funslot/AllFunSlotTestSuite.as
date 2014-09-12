package com.games.funslot 
{
	import com.games.funslot.decorators.AllDecoratorsTestSuite;
	import com.games.funslot.model.AllModelTestSuite;
	/**
	 * ...
	 * @author Leonid Trofimchuk
	 * Contains only suit classes 
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class AllFunSlotTestSuite
	{
		public var allModelTestSuite:AllModelTestSuite;
		public var allDecoratorsTestSuite:AllDecoratorsTestSuite;
		
	}
}
